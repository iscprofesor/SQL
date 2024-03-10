SELECT LastName, Country
FROM Customers
WHERE Country = 'Germany';

SELECT
  DISTINCT customer_id
FROM
  customer_data.customer_address

SELECT
  LENGTH(country) AS letters_in_country
FROM
  customer_data.customer_address

SELECT 
  country
FROM
  customer_data.customer_address
WHERE
  LENGTH(country) > 2


SELECT
  customer_id
FROM
  `customer_data.customer_address`
WHERE
  SUBSTR(country,1,2) = 'US'


SELECT
 DISTINCT customer_id
FROM
  `customer_data.customer_address`
WHERE
  SUBSTR(country,1,2) = 'US'


 
SELECT
  state
FROM
  `customer_data.customer_address`
WHERE
  LENGTH(state) > 2


SELECT
  DISTINCT customer_id
FROM
  `customer_data.customer_address`
WHERE
  TRIM(state) = 'OH'


SELECT
    CustomerId, InvoiceDate, Total 
FROM
    invoices
WHERE
    Total > 20


SELECT DISTINCT fuel_type 
FROM coches.car_info;


SELECT MIN(length) AS min_length, MAX(length) AS max_length FROM coches.car_info;


SELECT * FROM cars.car_info
WHERE
num_of_doors IS NULL;

UPDATE cars.car_info SET num_of_doors = "four" WHERE make = "dodge" AND fuel_type = "gas" AND body_style = "sedan";

SELECT DISTINCT num_of_cylinders FROM cars.car_info;

UPDATE cars.car_info SET num_of_cylinders = "two" WHERE num_of_cylinders = "tow";

SELECT MIN(compression_ratio) AS min_compression_ratio, MAX(compression_ratio) AS max_compression_ratio FROM cars.car_info;

SELECT MIN(compression_ratio) AS min_compression_ratio, MAX(compression_ratio) AS max_compression_ratio FROM cars.car_info
WHERE
compression_ratio <> 70;

SELECT
COUNT(*) AS num_of_rows_to_delete
FROM
cars.car_info
WHERE
compression_ratio = 70;

DELETE cars.car_info
WHERE compression_ratio = 70;

SELECT DISTINCT drive_wheels FROM cars.car_info;

SELECT DISTINCT drive_wheels, LENGTH(drive_wheels) AS string_length FROM cars.car_info;

UPDATE
cars.car_info
SET
drive_wheels = TRIM(drive_wheels)
WHERE TRUE;

SELECT DISTINCT drive_wheels FROM cars.car_info;

SELECT
  purchase_price
FROM
  `customer_data.customer_purchase`
ORDER BY
  purchase_price DESC


SELECT
  CAST(purchase_price AS FLOAT64)
FROM
  `customer_data.customer_purchase`
ORDER BY
  CAST(purchase_price AS FLOAT64) DESC


SELECT
  date,
  purchase_price
FROM
  `customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31'

SELECT
  CAST(date AS date) AS date only,
  purchase_price
FROM
  `customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31'



SELECT
  CONCAT(product_code, product_color) AS new_product_code
FROM
  `customer_data.customer_purchase`
WHERE
  product = 'couch'


SELECT
  COALESCE(product, product_code) AS product_info
FROM
  `customer_data.customer_purchase`


SELECT DISTINCT customer_id
FROM
invoice
ORDER BY
invoice_id
