USE sakila_datawarehouse;

-- Above code was to create the database that will be used for the date dimension integration and for exporting csv files
-- Below code will create a table of data from the sakila.rental table
-- Then create three separate tables from that which will all be converted to csv files
-- And then uploaded to the dbfs filestream to demonstrate viability of final project for reading hot path data


DROP TABLE IF EXISTS sakila_datawarehouse.fact_rentals_1;
CREATE TABLE sakila_datawarehouse.fact_rentals_1 
 AS SELECT * FROM sakila_datawarehouse.fact_orders 
 WHERE  rental_key >= 1 AND rental_key <= 200;

DROP TABLE IF EXISTS sakila_datawarehouse.fact_rentals_2;
CREATE TABLE sakila_datawarehouse.fact_rentals_2
 AS SELECT * FROM sakila_datawarehouse.fact_orders 
 WHERE  rental_key >= 201 AND rental_key <= 400;
 
DROP TABLE IF EXISTS sakila_datawarehouse.fact_rentals_3;
CREATE TABLE sakila_datawarehouse.fact_rentals_3 
 AS SELECT * FROM sakila_datawarehouse.fact_orders 
 WHERE  rental_key >= 401 AND rental_key <= 600;

SELECT * FROM sakila_datawarehouse.fact_rentals_1;
SELECT * FROM sakila_datawarehouse.fact_rentals_2;
SELECT * FROM sakila_datawarehouse.fact_rentals_3;