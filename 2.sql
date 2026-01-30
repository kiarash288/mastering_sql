CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
)
INSERT INTO users (username) 
VALUES 
    ('mmd')
    ('ahmad')


CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200)
    user_id INTEGER REFERENCES users(id)
)

CREATE TABLE comments (
    photo_id INTEGER REFERENCES photos(id),
    user_id INTEGER REFERENCES user(id),
    id SERIAL PRIMARY KEY,
    content
)
-- 2JOIN 

SELECT username,url,content
FROM photos
JOIN users ON users.id = photos.user_id,
JOIN comments ON comments.user_id = photo.user_id AND comments.user_id = users.id

-- we can use WHERE after JOIN

SELECT username,url 
FROM photos
JOIN on users.id = photos.user_id
WHERE 

SELECT url, username FROM photos
JOIN users on users.id = photo.user_id;

-- grouping by sth

SELECT user_id 
FROM comments
GROUP BY user_id;

SELECT user_id, COUNT(id)
FROM comments
GROUP BY user_id;


SELECT users.username, COUNT(*)
FROM comments
JOIN users ON user.id = comments.user_id
GROUPED BY users.username;


SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id >3
GROUP BY photo_id
HAVING COUNT(*)>5;


SELECT user_id,COUNT(*)
FROM comments
WHERE photo_id<3
GROUP BY user_id
HAVING COUNT(*)>2;


--sorting

SELECT *
FROM products
ORDER BY price; -- or ORDER BY price DESC or ASC;

SELECT *
FROM products
ORDER BY name;

SELECT *
FROM products
ORDER BY price,weights DESC;

SELECT *
FROM products
ORDER BY price DESC
LIMIT BY 5
OFFSET 1;

-- UNION

(
    SELECT*
    FROM product
    ORDER BY price DESC
    LIMIT 4
)
UNION
(
    SELECT*
    FROM product
    ORDER BY price/weights DESC
    LIMIT 4    
)