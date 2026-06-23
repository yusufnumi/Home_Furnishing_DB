CREATE DATABASE home_furnishing_store_db;
USE home_furnishing_store_db;

CREATE TABLE CUSTOMER(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    registiration_date DATE NOT NULL DEFAULT(CURRENT_DATE),
	e_mail VARCHAR(45) UNIQUE,
    city VARCHAR(45),
    CONSTRAINT chk_phone CHECK (((phone LIKE "05%") OR (phone LIKE "02%"))AND (CHAR_LENGTH(phone) = 11))
    );
CREATE TABLE STORE(
	store_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(45) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    store_name VARCHAR(45) NOT NULL,
	CONSTRAINT chk_store_phone CHECK (((phone LIKE "05%") OR (phone LIKE "02%"))AND (CHAR_LENGTH(phone) = 11))
	);
CREATE TABLE COLOR(
	color_id INT PRIMARY KEY AUTO_INCREMENT,
	color_name VARCHAR(45) NOT NULL UNIQUE
    );
    
CREATE TABLE MATERIAL(
	material_id INT PRIMARY KEY AUTO_INCREMENT,
    material_name VARCHAR(45) NOT NULL UNIQUE
    );

CREATE TABLE CATEGORY(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(45) NOT NULL,
    parent_category_id INT,
    CONSTRAINT fk_c_parent_category_id FOREIGN KEY (parent_category_id) REFERENCES CATEGORY(category_id) ON DELETE CASCADE ON UPDATE RESTRICT
    );

CREATE TABLE PRODUCT(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fkp_category_id FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT chk_unit_price CHECK (unit_price > 0.00)
    );

    
CREATE TABLE EMPLOYEE(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    role VARCHAR(45) NOT NULL,
    is_active BOOL NOT NULL DEFAULT TRUE,
    employment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    store_id INT NOT NULL,
    CONSTRAINT fke_store_id FOREIGN KEY (store_id) REFERENCES STORE(store_id)  ON DELETE RESTRICT ON UPDATE RESTRICT
    );
    
CREATE TABLE STOCK(
	store_id INT NOT NULL,
    product_id INT NOT NULL,
	color_id INT NOT NULL,
    aisle VARCHAR(45) NOT NULL,
    shelf VARCHAR(45) NOT NULL,
    quantity_on_hand INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_stock PRIMARY KEY (store_id,product_id,color_id),
    CONSTRAINT fks_color_id FOREIGN KEY (color_id) REFERENCES COLOR(color_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fks_store_id FOREIGN KEY (store_id) REFERENCES STORE(store_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT fks_product_id FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT chk_quantity_on_hand CHECK (quantity_on_hand >= 0)
    );
    
CREATE TABLE CUSTOMER_ORDER(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    order_status BOOL NOT NULL DEFAULT FALSE,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    CONSTRAINT fkc_customer_id FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT fkc_store_id FOREIGN KEY (store_id) REFERENCES STORE(store_id) ON DELETE RESTRICT ON UPDATE RESTRICT
    );
    
CREATE TABLE DELIVERY(
	delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(150) NOT NULL,
    delivery_status BOOL NOT NULL,
    delivery_type VARCHAR(45)  NOT NULL DEFAULT 'LAND',
    planned_delivery_date DATE NOT NULL,
    order_id INT NOT NULL UNIQUE,
    CONSTRAINT chk_delivery_type CHECK (delivery_type IN ('LAND','SEA','AIR')),
    CONSTRAINT fkd_order_id FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER(order_id) ON DELETE CASCADE ON UPDATE RESTRICT
	);
    
CREATE TABLE PAYMENT(
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_method VARCHAR(45) NOT NULL DEFAULT 'CASH',
    amount DECIMAL(10,2) NOT NULL, 
    payment_date DATE NOT NULL,
    order_id INT NOT NULL UNIQUE,
    CONSTRAINT chk_amount CHECK (amount > 0.00),
    CONSTRAINT chk_payment_method CHECK (payment_method IN ('CASH','CARD')),
    CONSTRAINT fkp_order_id FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER(order_id) ON DELETE CASCADE ON UPDATE RESTRICT
    );
    
CREATE TABLE ORDER_PRODUCT(
	order_id INT NOT NULL,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
	CONSTRAINT pk_order_product PRIMARY KEY (order_id,product_id,color_id),
    CONSTRAINT chk_quantity CHECK (quantity >= 0),
    CONSTRAINT fko_order_id FOREIGN KEY (order_id) REFERENCES CUSTOMER_ORDER(order_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT fko_product_id FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT fko_color_id FOREIGN KEY (color_id) REFERENCES COLOR(color_id) ON DELETE RESTRICT ON UPDATE RESTRICT
    );
    

CREATE TABLE PRODUCT_COLOR(
	product_id INT NOT NULL,
	color_id INT NOT NULL,
    CONSTRAINT pk_product_color PRIMARY KEY(product_id,color_id),
    CONSTRAINT fkpc_product_id FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT fkpc_color_id FOREIGN KEY (color_id) REFERENCES COLOR(color_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
CREATE TABLE PRODUCT_MATERIAL(
	product_id INT NOT NULL,
    material_id INT NOT NULL,
    CONSTRAINT pk_product_material PRIMARY KEY(product_id,material_id),
    CONSTRAINT fkpm_product_id FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT fkpm_material_id FOREIGN KEY (material_id) REFERENCES MATERIAL(material_id) ON DELETE RESTRICT ON UPDATE RESTRICT
    );


DELIMITER //
	CREATE TRIGGER trg_order_date_bi BEFORE INSERT ON CUSTOMER_ORDER FOR EACH ROW
		BEGIN
			IF NEW.order_date > CURRENT_DATE THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Eklenen siparişin tarihi gelecekte olamaz!!!!';
			END IF;
		END//
	CREATE TRIGGER trg_order_date_bu BEFORE UPDATE ON CUSTOMER_ORDER FOR EACH ROW 
		BEGIN
			IF NEW.order_date > CURRENT_DATE THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Güncellenen siparişin tarihi gelecekte olamaz!!!!';
			END IF;
            
            IF EXISTS(SELECT 1 FROM PAYMENT p WHERE p.order_id = NEW.order_id AND p.payment_date < NEW.order_date) THEN
                SIGNAL SQLSTATE "50001" SET MESSAGE_TEXT = 'Güncellenen sipariş tarihi ödeme tarihinden sonraki bir tarih olarak ayarlanamaz!!!!';
			END IF;
            
            IF EXISTS(SELECT 1 FROM DELIVERY d WHERE d.order_id = NEW.order_id AND d.planned_delivery_date < NEW.order_date) THEN
				SIGNAL SQLSTATE "50001" SET MESSAGE_TEXT = 'Güncellenen sipariş tarihi teslimat tarihinden sonraki bir tarih olarak ayarlanamaz!!!!';
			END IF;
		END//
	CREATE TRIGGER trg_payment_bi BEFORE INSERT ON PAYMENT FOR EACH ROW
		BEGIN
			DECLARE v_order_date DATE;
			DECLARE v_amount DECIMAL(10,2);

			SELECT order_date INTO v_order_date FROM CUSTOMER_ORDER WHERE order_id = NEW.order_id;

			IF NEW.payment_date < v_order_date THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Eklenen ödeme tarihi sipariş tarihinden önce olamaz!!!!';
			END IF;

			SELECT SUM(op.quantity * p.unit_price) INTO v_amount FROM ORDER_PRODUCT op JOIN PRODUCT p ON p.product_id = op.product_id WHERE op.order_id = NEW.order_id;

			IF v_amount IS NULL OR v_amount <= 0 THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Ödeme oluşturulamaz: Siparişte ürün yok veya toplam tutar 0.';
			END IF;

			SET NEW.amount = v_amount;
		END//
	CREATE TRIGGER trg_payment_date_bu BEFORE UPDATE ON PAYMENT FOR EACH ROW 
		BEGIN
			IF EXISTS (SELECT 1 FROM CUSTOMER_ORDER co WHERE co.order_id = NEW.order_id AND NEW.payment_date < co.order_date) THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Güncellenen ödeme tarihi sipariş tarihinden önce olamaz!!!!';
			END IF;
			SET NEW.amount = OLD.amount;
		END//

	CREATE TRIGGER trg_delivery_date_bi BEFORE INSERT ON DELIVERY FOR EACH ROW
		BEGIN
			IF EXISTS (SELECT 1 FROM CUSTOMER_ORDER co WHERE co.order_id = NEW.order_id AND NEW.planned_delivery_date <= co.order_date) THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Eklenen Planlanan teslimat tarihi sipariş tarihinden sonra olmalıdır!!!!';
		END IF;
		END//

	CREATE TRIGGER trg_delivery_date_bu BEFORE UPDATE ON DELIVERY FOR EACH ROW
		BEGIN
			IF EXISTS (SELECT 1 FROM CUSTOMER_ORDER co WHERE co.order_id = NEW.order_id AND NEW.planned_delivery_date <= co.order_date) THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Güncellenen planlanan teslimat tarihi sipariş tarihinden sonra olmalıdır!!!!';
		END IF;
		END//
    --
	CREATE TRIGGER trg_order_product_bi BEFORE INSERT ON ORDER_PRODUCT FOR EACH ROW
		BEGIN
			DECLARE v_store_id INT;
            DECLARE v_stock INT;
            
            SELECT store_id INTO v_store_id FROM CUSTOMER_ORDER WHERE order_id = NEW.order_id;
			
            IF v_store_id IS NULL THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Geçersiz sipariş bilgisi!';
			END IF;
            
            SELECT quantity_on_hand INTO v_stock FROM STOCK WHERE store_id = v_store_id AND product_id = NEW.product_id AND color_id = NEW.color_id;
            
            IF v_stock IS NULL OR v_stock < NEW.quantity THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Bu mağazada yeterli stok yok';
			END IF;
		END//
    --
    CREATE TRIGGER trg_order_product_ai AFTER INSERT ON ORDER_PRODUCT FOR EACH ROW
		BEGIN
			DECLARE v_store_id INT;
            
            SELECT store_id INTO v_store_id FROM CUSTOMER_ORDER WHERE order_id = NEW.order_id;
		
			UPDATE STOCK SET quantity_on_hand = (quantity_on_hand - NEW.quantity) WHERE store_id = v_store_id AND product_id = NEW.product_id AND color_id = NEW.color_id;
		END//
    CREATE TRIGGER trg_order_product_bu BEFORE UPDATE ON ORDER_PRODUCT FOR EACH ROW
		BEGIN
			DECLARE DIFF INT;
            DECLARE v_stock INT;
            DECLARE v_store_id INT;
            
            SET DIFF = NEW.quantity - OLD.quantity;
            
            IF DIFF > 0 THEN
				SELECT store_id INTO v_store_id FROM CUSTOMER_ORDER WHERE order_id = NEW.order_id;
                
				SELECT quantity_on_hand INTO v_stock FROM STOCK WHERE store_id = v_store_id AND product_id = NEW.product_id AND color_id = NEW.color_id;
                
                IF v_stock IS NULL OR v_stock < DIFF THEN
					SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Sipariş güncelleme: stok yetersiz!';
				END IF;
			END IF;
		END//
	
    CREATE TRIGGER trg_order_product_au AFTER UPDATE ON ORDER_PRODUCT FOR EACH ROW
		BEGIN
			DECLARE v_store_id INT;
            
            SELECT store_id INTO v_store_id FROM CUSTOMER_ORDER WHERE order_id = NEW.order_id;
            
			UPDATE STOCK SET quantity_on_hand = quantity_on_hand - (NEW.quantity - OLD.quantity) WHERE store_id = v_store_id AND product_id = NEW.product_id AND color_id = NEW.color_id;
		END//
DELIMITER ;

CREATE VIEW stores_and_employees AS
SELECT s.store_name, s.city, s.phone, CONCAT(e.first_name, ' ', e.last_name), e.role, e.is_active, DATEDIFF(CURRENT_DATE, e.employment_date) FROM STORE s
INNER JOIN EMPLOYEE e ON e.store_id = s.store_id;

# SELECT * FROM stores_and_employees;


CREATE VIEW istanbul_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "İstanbul";

CREATE VIEW ankara_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Ankara";

CREATE VIEW izmir_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "İzmir";

CREATE VIEW bursa_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Bursa";

CREATE VIEW antalya_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Antalya";

CREATE VIEW adana_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Adana";

CREATE VIEW mugla_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Muğla";

CREATE VIEW eskisehir_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Eskişehir";

CREATE VIEW zonguldak_stores_and_products AS
SELECT st.store_name,st.city,p.product_id, p.product_name, c.color_name, s.quantity_on_hand FROM PRODUCT p
JOIN PRODUCT_COLOR pc ON p.product_id = pc.product_id
JOIN COLOR c ON pc.color_id = c.color_id
JOIN STOCK s ON s.product_id = p.product_id AND s.color_id = c.color_id
JOIN STORE st ON st.store_id = s.store_id
WHERE st.city = "Zonguldak";



CREATE VIEW all_orders AS SELECT co.order_id,co.order_date,co.order_status,s.store_name,s.city AS store_city,CONCAT(c.first_name, ' ', c.last_name) 
AS full_name,d.planned_delivery_date,
d.delivery_status,CONCAT(p.product_name, '/', cl.color_name) 
AS product_and_color,op.quantity,p.unit_price,(op.quantity * p.unit_price) AS product_amount,pa.amount AS order_total
FROM CUSTOMER_ORDER co JOIN ORDER_PRODUCT op ON co.order_id = op.order_id
JOIN PRODUCT p ON p.product_id = op.product_id JOIN COLOR cl  ON cl.color_id = op.color_id JOIN PAYMENT pa  
ON pa.order_id = co.order_id JOIN DELIVERY d  ON d.order_id = co.order_id
JOIN CUSTOMER c ON c.customer_id = co.customer_id JOIN STORE s ON s.store_id = co.store_id
 ORDER BY co.order_date DESC;



DELIMITER //

CREATE PROCEDURE stock_change(IN p_store_id INT, IN p_product_id INT, IN p_color_id INT, INOUT change_amount INT)
BEGIN
	UPDATE STOCK SET quantity_on_hand = quantity_on_hand + change_amount
    WHERE store_id = p_store_id
    AND product_id = p_product_id
    AND color_id = p_color_id;
    
    SELECT quantity_on_hand INTO change_amount FROM STOCK
    WHERE store_id = p_store_id
    AND product_id = p_product_id
    AND color_id = p_color_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE hiring(IN p_first_name VARCHAR(45), IN p_last_name VARCHAR(45), IN p_role VARCHAR(45),
IN p_is_active BOOL, IN p_employment_date DATE, IN p_store_id INT)
BEGIN
	INSERT INTO EMPLOYEE(first_name, last_name, role, is_active, employment_date, store_id)
    VALUES(p_first_name, p_last_name, p_role, p_is_active, p_employment_date, p_store_id);
    
    SELECT * FROM EMPLOYEE WHERE employee_id = (SELECT MAX(employee_id) FROM EMPLOYEE);
END //

DELIMITER ;





