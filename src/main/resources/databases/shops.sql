--Author Serhii Detynych---

DROP TABLE IF EXISTS store_types;
DROP TABLE IF EXISTS stores CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS store_products;

CREATE TABLE IF NOT EXISTS store_types
(
  id SERIAL NOT NULL CONSTRAINT store_types_key PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS stores
(
  id SERIAL NOT NULL CONSTRAINT stores_key PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  type INTEGER NOT NULL,
  cash_desk_quantity INTEGER NOT NULL,
  delivery BOOLEAN NOT NULL,
  FOREIGN KEY (type) REFERENCES store_types (id)
);

CREATE TABLE IF NOT EXISTS products
(
  id SERIAL NOT NULL CONSTRAINT products_key PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price NUMERIC NOT NULL,
  calculation VARCHAR(10) NOT NULL,
  manufacturer VARCHAR(255) NOT NULL,
  production_date TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS store_products
(
  store_id INT NOT NULL,
  product_id INT NOT NULL,
  FOREIGN KEY (store_id) REFERENCES stores (id) ON DELETE CASCADE ,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);

INSERT INTO store_types (type)
VALUES ('Универсальный'),
       ('Хозяйственный'),
       ('Строительный'),
       ('Продуктовый');

INSERT INTO stores (name, phone, type, cash_desk_quantity, delivery)
VALUES ('Эпицентр', '+380448855221', 3, 21,true),
       ('Чудо маркет', '+380442299884', 4, 3, false),
       ('ТРЦ Дафи', '+380449955882', 1, 44, true);

INSERT INTO products (name, price, calculation, manufacturer, production_date)
VALUES ('Картошка', 14.55, 'kg', 'Ukrainian field', '2020-9-01 17:20:00'),
       ('Люстра "Магма"', 300.77, 'шт', 'Завод ламп "Светлое будующее"', '1962-11-9 8:33:25'),
       ('Куртка "ПижОн"', 7859.21, 'шт', 'Ателье "Руки Крюки"', '2020-5-9 23:48:54');

INSERT INTO store_products (store_id, product_id)
VALUES (1, 2),
       (3, 1),
       (3, 2),
       (3, 3),
       (2, 1);


SELECT * FROM stores;
SELECT * FROM products WHERE price > 200;

UPDATE stores SET phone = '+380953420948' WHERE phone = '+380448855221';

DELETE FROM products WHERE price < 100;

