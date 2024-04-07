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


SELECT
  station_id,
  num_bikes_available,
  (SELECT
    AVG(num_bikes_available)
  FROM `bigquery-public-data.new_york.citibike_stations`) AS avg_num_bikes_available
FROM
  `bigquery-public-data.new_york.citibike_stations`


SELECT
  station_id,
  name,
  number_of_rides AS number_of_rides_starting_at_station
FROM
  (
    SELECT
      start_station_id,
      COUNT(*) number_of_rides
    FROM
      `bigquery-public-data.new_york.citibike_trips`
      GROUP BY
        start_station_id
  )
  AS station_num_trips
  INNER JOIN
  `bigquery-public-data.new_york.citibike_stations` ON station_id = cast(start_station_id as string)
  ORDER BY
    number_of_rides DESC


SELECT
  station_id,
  name
FROM
  `bigquery-public-data.new_york.citibike_stations`
WHERE
  station_id IN
  (
    SELECT
      CAST(start_station_id as STRING)
    FROM
      `bigquery-public-data.new_york.citibike_trips`
    WHERE
      usertype = 'Subscriber'  
  )


SELECT 
  Warehouse.warehouse_id,
  CONCAT(Warehouse.state, ': ', Warehouse.warehouse_alias) AS warehouse_name,
  COUNT(Orders.order_id) AS number_of_orders,
  (SELECT
    COUNT(*)
    FROM warehouse_orders.Orders Orders)
    AS total_orders,
    CASE
      WHEN COUNT(Orders.order_id) / (SELECT COUNT(*) FROM warehouse_orders.Orders Orders) <= 0.20)
      THEN "fulfilled 0-20% od Orders"
      WHEN COUNT(Orders.order_id) / (SELECT COUNT(*) FROM warehouse_orders.Orders Orders) > 0.20)
      AND COUNT(Orders.order_id) / (SELECT COUNT(*) FROM warehouse_orders.Orders Orders) <= 0.60)
      THEN "fulfilled 21-60% od Orders"
    ELSE "fulfilled more than 60% od Orders"
    END AS fulfillment_summary
FROM 
  `my-data-project12345-413801.warehouse_orders.Warehouse` Warehouse
LEFT JOIN
  `my-data-project12345-413801.warehouse_orders.Orders ` Orders
  ON Orders.warehouse_id = Warehouse.warehouse_id
GROUP BY
  Warehouse.warehouse_id,
  warehouse.name
HAVING
  COUNT(Orders.order_id) > 0

SELECT 
  Warehouse.id_dep__sito,
  CONCAT(Warehouse.estado, ': ', Warehouse.alias_dep__sito) AS warehouse_name,
  COUNT(Orders.id_pedido) AS number_of_orders,
  (SELECT
    COUNT(*)
    FROM `my-data-project12345-413801.warehouse_orders.Orders ` Orders)
    AS total_orders,
    CASE
      WHEN COUNT(Orders.id_pedido) / (SELECT COUNT(*) FROM `my-data-project12345-413801.warehouse_orders.Orders ` Orders) <= 0.20
      THEN "fulfilled 0-20% od Orders"
      WHEN COUNT(Orders.id_pedido) / (SELECT COUNT(*) FROM `my-data-project12345-413801.warehouse_orders.Orders ` Orders) > 0.20
      AND COUNT(Orders.id_pedido) / (SELECT COUNT(*) FROM `my-data-project12345-413801.warehouse_orders.Orders ` Orders) <= 0.60
      THEN "fulfilled 21-60% od Orders"
    ELSE "fulfilled more than 60% od Orders"
    END AS fulfillment_summary
FROM 
  `my-data-project12345-413801.warehouse_orders.Warehouse` Warehouse
LEFT JOIN
  `my-data-project12345-413801.warehouse_orders.Orders ` Orders
  ON Orders.id_dep___sito = Warehouse.id_dep__sito
GROUP BY
  Warehouse.id_dep__sito,
  warehouse.estado,
  warehouse.alias_dep__sito
HAVING
  COUNT(Orders.id_pedido) > 0


SELECT account_table.*
  FROM(
        SELECT *
          FROM transaction.sf_model_feature_2014_01
        WHERE day_of_week = 'Friday'
      ) account_table.availability = 'YES'

Existen algunas reglas que deben seguir las subconsultas:

Las subconsultas tienen que estar dentro de paréntesis

Una subconsulta puede tener una sola columna especificada en la cláusula SELECT. Si quieres que una subconsulta compare varias columnas, esas columnas deben haberse seleccionado en la consulta principal.

Las subconsultas que devuelven más de una fila solo pueden usarse con múltiples operadores de valor, tales como el operador IN que permite especificar múltiples valores en una cláusula WHERE.

Una subconsulta no puede estar anidada en un comando SET. El comando SET se usa con UPDATE para especificar qué columnas (y valores) se deben actualizar en una tabla.

SELECT
  Date,
  Region,
  Small_Bags,
  Large_Bags,
  XLarge_Bags,
  Total_Bags,
  Small_Bags + Large_Bags + XLarge_Bags AS Total_Bags_Calc
FROM `my-data-project12345-413801.avocado_data.avocado_prices`

SELECT
  Date,
  Region,  
  Total_Bags,
  Small_Bags,
  (Small_Bags / Total_Bags) * 100 AS Small_Bags_Percent
FROM `my-data-project12345-413801.avocado_data.avocado_prices`
WHERE
  Total_Bags != 0

SELECT
  EXTRACT(YEAR FROM STARTTIME) AS year,
  COUNT(*) AS number_of_rides
FROM 
  `bigquery-public-data.new_york.citibike_trips`
GROUP BY
  year
ORDER BY
  year
