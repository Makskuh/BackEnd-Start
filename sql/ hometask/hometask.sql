CREATE TABLE workers (
id SERIAL PRIMARY KEY,
worker_name VARCHAR(64) NOT NULL,
birthday DATE NOT NULL CHECK(
    birthday > '1900-01-01'
    AND birthday < current_date
  ),
salary INT NOT NULL CHECK(salary > 0)
)
-- ALTER

ALTER TABLE workers 
ADD COLUMN rest_days INT DEFAULT 0 CHECK( rest_days >= 0 ),
ADD COLUMN email VARCHAR(128) UNIQUE

ALTER TABLE workers 
ADD CHECK(email != ''),
ALTER COLUMN email SET NOT NULL

ALTER TABLE workers 
ALTER COLUMN salary SET DEFAULT 500

ALTER TABLE workers RENAME TO emloyees

ALTER TABLE emloyees 
DROP COLUMN email

-- INSERT
INSERT INTO emloyees (worker_name,birthday,salary) VALUES ('Mykyta','1990-01-01',600)

INSERT INTO emloyees(worker_name,birthday,salary) VALUES ('Svitlana','1966-02-03',1200)

INSERT INTO emloyees(worker_name,birthday,salary) VALUES ('Yaroslav', '1980-10-10',1500),('Pavlo','1993-12-12',1000)

INSERT INTO emloyees(worker_name,birthday,salary) VALUES('Oleg','1992-05-28',200),('Maksim','1995-07-17',300),('Oksana','1989-03-08',900),('Oleksandr','1970-12-26',3000)

-- UPDATE

UPDATE emloyees SET salary = 2000 WHERE worker_name = 'Pavlo'

UPDATE emloyees SET birthday = '1987-02-01' WHERE id=4;

UPDATE emloyees SET salary = 700 WHERE salary <= 400

UPDATE emloyees SET rest_days = 5 WHERE id BETWEEN 18 AND 21

UPDATE emloyees SET 
worker_name = 'Evgen',
salary = salary + 200
WHERE worker_name = 'Yaroslav'

--SELECT
SELECT * FROM emloyees WHERE id = 20;

SELECT * FROM emloyees WHERE salary < 800;

SELECT * FROM emloyees WHERE salary != 500;

SELECT salary,rest_days FROM emloyees WHERE worker_name = 'Evgen';

SELECT * FROM emloyees WHERE worker_name != 'Petro';

SELECT * FROM emloyees WHERE (EXTRACT( YEAR from birthday) = (EXTRACT(YEAR from CURRENT_TIMESTAMP) - 28 )) OR salary = 900;

SELECT * FROM emloyees WHERE EXTRACT( YEAR from birthday) BETWEEN EXTRACT(YEAR from CURRENT_TIMESTAMP) - 28 AND EXTRACT(YEAR from CURRENT_TIMESTAMP) -26

SELECT * FROM emloyees WHERE (EXTRACT( YEAR from birthday) BETWEEN EXTRACT(YEAR from CURRENT_TIMESTAMP) - 28 AND EXTRACT(YEAR from CURRENT_TIMESTAMP) -26 ) OR salary BETWEEN 400 AND 1000;

-- DELETE 

DELETE FROM emloyees WHERE id = 17;

DELETE FROM emloyees WHERE worker_name = 'Mykola';


DELETE FROM emloyees WHERE rest_days > 20

DROP TABLE emloyees
