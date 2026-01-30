CREATE TABLE cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
); 

INSERT INTO cities (name, country, population, area)
VALUES ('tokyo', 'japan', 34567, 253);

INSERT INTO cities (name, country, population, area)
VALUES 
    ('Dehli', 'India', 9856, 432),
    ('Shanghai', 'China', 3954, 709),
    ('gozabad', 'Jov', 45, 756);

SELECT * FROM cities;
SELECT name,country FROM cities;

SELECT name, population/area AS population_density
 FROM cities;

SELECT name || ',' || country AS location FROM cities; 
SELECT CONCAT(name, ', ', country) AS location FROM cities;

// creating 4 tables for liking system 

--------------------------------------------------  

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

SELECT url, username FROM photos
JOIN users on users.id = photo.user_id;