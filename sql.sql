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


SELECT
  customer_id,
  CASE
    WHEN first_name = 'Tnoy' THEN 'Tony'
    ELSE first_name
    END AS cleaned_name
  FROM
    customer_data.customer_name

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT 
    *
FROM
    invoices
WHERE 
    BillingCountry = 'Germany' AND Total > 5;


SELECT 
    * 
FROM 
    customer
WHERE 
    country = 'Brazil'


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT *
FROM `movie_data.movies `
ORDER BY Fecha_de_estreno DESC

SELECT *
FROM `movie_data.movies `
WHERE G__nero = 'Comedia'
ORDER BY Fecha_de_estreno DESC

SELECT *
FROM `movie_data.movies `
WHERE G__nero = 'Comedia' AND Ingresos > 300000000
ORDER BY Fecha_de_estreno DESC

SELECT Name
FROM Genres
ORDER BY Name

SELECT *
FROM Tracks
WHERE Composer = 'Chris Cornell'
ORDER BY GenreId DESC

SELECT stn, date, IF(temp=9999.9, NULL, temp) AS temperature
FROM bigquery-public-data.noaa_gsod.gsod2020

SELECT stn, date, IF(wdsp="999.9", NULL, CAST(wdsp AS Float64)) AS wind_speed
FROM bigquery-public-data.noaa_gsod.gsod2020

SELECT stn, date, IF(prcp=99.99, 0, prcp) AS precipitation FROM `bigquery-public-data.noaa_gsod.gsod2020` WHERE stn="725030" 
-- La Guardia
-- OR stn="744860" -- JFK ORDER BY date DESC, stn ASC

SELECT
  CONCAT(start_station_name, end_station_name) AS station_name
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`

SELECT
  usertype,
  CONCAT(start_station_name, " to ", end_station_name) AS route,
  COUNT(*) as num_trips,
  ROUND(AVG(CAST(tripduration as int64) / 60), 2) AS duration
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
GROUP BY
  start_station_name, end_station_name, usertype
ORDER BY
  num_trips DESC
LIMIT 10

SELECT
*
FROM
  tableA
LEFT JOIN
  tableB
ON
  keyA = keyB

SELECT
*
FROM
  tableB
RIGHT JOIN
  tableA
ON
  keyA = keyB

SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  employee_data.employees
INNER JOIN
  employee_data.departments ON
  employees.department_id = departments.department_id

SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  employees
INNER JOIN
  departments ON
  employees.department_id = departments.department_id

/// La query anterior la modifique de la siguiente manera y funciono.
SELECT
  e.name, e.role, d.name
FROM
  `my-data-project12345-413801.employee_data.employees` AS e
INNER JOIN
  `my-data-project12345-413801.employee_data.departments` AS d
ON
  e.department_id = d.department_id

SELECT
  e.name, e.role, d.name
FROM
  `my-data-project12345-413801.employee_data.employees` AS e
LEFT JOIN
  `my-data-project12345-413801.employee_data.departments` AS d
ON
  e.department_id = d.department_id

SELECT
  e.name, e.role, d.name
FROM
  `my-data-project12345-413801.employee_data.employees` AS e
RIGHT JOIN
  `my-data-project12345-413801.employee_data.departments` AS d
ON
  e.department_id = d.department_id

SELECT
  e.name, e.role, d.name
FROM
  `my-data-project12345-413801.employee_data.employees` AS e
FULL OUTER JOIN
  `my-data-project12345-413801.employee_data.departments` AS d
ON
  e.department_id = d.department_id

-- Let's say table_1 has 100 rows and table_2 has 10 rows.
-- They share 10 keys in common.

-- Using INNER JOIN --> We get 10 rows in our results.
SELECT
    COUNT(*)
FROM
    table_1
INNER JOIN
    table_2
ON table_1.key = table_2.key;

-- Using LEFT JOIN --> We get 100 rows in our results.
SELECT
    COUNT(*)
FROM
    table_1
LEFT JOIN
    table_2
ON table_1.key = table_2.key;

SELECT
 seasons.market AS university,
 seasons.name AS team_name,
 seasons.wins,
 seasons.losses,
 seasons.ties,
 mascots.mascot AS team_mascot
FROM
 `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
LEFT JOIN
 `bigquery-public-data.ncaa_basketball.mascots` AS mascots
ON
 seasons.team_id = mascots.id
WHERE
 seasons.season = 1984
 AND seasons.division = 1
ORDER BY
 seasons.market
