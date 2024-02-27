CREATE TABLE production_products(    
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,    
);

ALTER TABLE production_products
DROP CONSTRAINT [PK__producti__47027DF5376AED03];

CREATE TABLE production_product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);


CREATE TRIGGER production_trg_product_audit
ON production_products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production_product_audits(
        product_id, 
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END


INSERT INTO production_products(product_id, product_name, brand_id, category_id, model_year, list_price)
VALUES (322, 'Test product', 1, 1, 2018, 599);

SELECT * FROM production_product_audits;

DELETE FROM production_products WHERE product_id = 322;

--====================INSTEAD OF triggers=========================

CREATE TABLE production_brand_approvals(
    brand_id INT IDENTITY PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

CREATE VIEW production_vw_brands 
AS
SELECT
    brand_name,
    'Approved' approval_status
FROM
    production_brands
UNION
SELECT
    brand_name,
    'Pending Approval' approval_status
FROM
    production_brand_approvals;


--=========================DDL Trigger===============================
CREATE TABLE index_logs (
    log_id INT IDENTITY PRIMARY KEY,
    event_data XML NOT NULL,
    changed_by SYSNAME NOT NULL
);
GO

CREATE TRIGGER trg_index_changes
ON DATABASE
FOR	
    CREATE_INDEX,
    ALTER_INDEX, 
    DROP_INDEX
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO index_logs (event_data, changed_by)
    VALUES (EVENTDATA(), USER);
END;
GO

CREATE NONCLUSTERED INDEX nidx_name
ON Customers(name);


SELECT * FROM index_logs;


