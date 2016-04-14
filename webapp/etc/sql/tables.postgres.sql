
-- Schema Name: posdb
-- Username: pos
-- Password: pos123Pos

-- These tables describe the database for a point of sale system

-- Make sure you have created a Postgres user with the above username, password
-- and appropriate permissions. For development environments, you can make the 
-- database user to be a superuser to allow for copying of external files. 

-- Then run the "dbSetup.sh" script in the bin folder of this project.

\c postgres

-- Then execute the following:
DROP DATABASE IF EXISTS posdb; -- To drop a database you can't be logged into it. Drops if it exists.
CREATE DATABASE posdb;

-- Connect with the database on the username
\c posdb pos



-- =========================
-- 1.  Payment Management
-- =========================

---------------------
-- Table paymentType
-- -------------------


CREATE TABLE  paymentType (
    Id SERIAL PRIMARY KEY,
    Uuid text UNIQUE NOT NULL,
    payType text,
   
);
\COPY paymentType(Uuid,payType) FROM '/tmp/paymentType.csv' WITH DELIMITER AS '|' CSV HEADER
ALTER TABLE paymentType OWNER TO pos;



-- =========================
-- 2.  Stock Management
-- =========================

--------------------
-- Table productCategory
-- -------------------

CREATE TABLE  productCategory (
    Id SERIAL PRIMARY KEY,
    Uuid text UNIQUE NOT NULL,
    payType text,
   
);
\COPY productCategory(Uuid,payType) FROM '/tmp/productCategory.csv' WITH DELIMITER AS '|' CSV HEADER
ALTER TABLE productCategory OWNER TO pos;


