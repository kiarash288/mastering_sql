-- UNION

(
    SELECT*
    FROM product
    ORDER BY price DESC
    LIMIT 4
)
UNION ALL -- EXCEPT or EXCEPT ALL or INTERSECT or INTERSECT ALL 
(
    SELECT*
    FROM product
    ORDER BY price/weights DESC
    LIMIT 4    
)

--SUBQUERY 

SELECT name,price 
FROM product
WHERE price > (
    SELECT MAX(price)
    FROM product
    WHERE department = 'toy'
);

SELECT name,price, (
    SELECT price FROM product 
    WHERE id = 3
) AS price_id3
FROM product
WHERE price > 879;

SELECT AVG(order_count)
FROM (
        SELECT user_id, COUNT(*) AS order_count
        FROM order 
        GROUP BY user_id
)
WHERE price > 675;

-- SUBQUERY in JOIN
SELECT name 
FROM users 
JOIN (
    SELECT user_id 
    FROM orders
    WHERE product_id = 3
) AS o 
ON o.user_id = users.id;

-- subquery in WHERE

SELECT id 
FROM orders 
WHERE product_id in (
    SELECT id
    FROM product
    WHERE price/weight > 800
)

-- user ALL for =,>,<,<> + SOME , ANY

SELECT price,name
FROM order
WHERE price > ALL (
    SELECT price
    FROM order
    WHERE department = 'toy'
);

SELECT price,name
FROM order
WHERE price > SOME (
    SELECT price
    FROM order
    WHERE department = 'toy'
);

--while loop in sql

SELECT p1.name (
    SELECT COUNT(*)
    FROM order as o1
    WHERE o1.product_id = p1.id
)
FROM product AS p1

-- SELECT without FROM if it returnes only one value,

SELECT (
    SELECT MAX(price)
    FROM order
) (
    SELECT AVG(price)
    FROM order
)

-- DISTINCT

SELECT DISTINCT department
FROM order;

SELECT COUNT(DISTINCT department)
FROM order;

-- GREATES just for postgres

SELECT name,wight, GREATEST(30,2*weight)
FROM product;

--LEAST!=GREATEST

SELECT name,LEAST(price*0.5,400)
FROM product;

--CASE 

SELECT 
    name,
    price,
    CASE
        WHEN price>300 THEN 'high'
        WHEN price>600 THEN 'medium'
        ELSE 'cheap'
    END
FROM product;