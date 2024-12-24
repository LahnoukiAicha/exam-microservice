BEGIN;

CREATE SEQUENCE IF NOT EXISTS category_seq INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS product_seq INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS category (
                                        id INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('category_seq'),
                                        description VARCHAR(255),
                                        name VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS productdb (
                                         id INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('product_seq'),
                                         available_quantity DOUBLE PRECISION NOT NULL DEFAULT 0,
                                         description VARCHAR(255),
                                         name VARCHAR(255),
                                         price NUMERIC(38, 2),
                                         category_id INTEGER
                                             CONSTRAINT fk_product_category
                                                 REFERENCES category
                                                 ON DELETE CASCADE
                                                 ON UPDATE CASCADE
);

COMMIT;
