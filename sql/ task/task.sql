CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(256) NOT NULL UNIQUE ,
  is_male BOOLEAN DEFAULT true,
  birthday DATE NOT NULL ,
  weight_person NUMERIC(4,1) NOT NULL,
  raiting NUMERIC(3,2) NOT NULL,
  CONSTRAINT "invalid email" CHECK( email ~ '^[a-zA-Z0-9]{1,32}@[a-z]{2,32}\.[a-z]{2,32}$'),
  CONSTRAINT "invalid birthday" CHECK (birthday > '1900-01-01' AND birthday < current_date ),
  CONSTRAINT "weight must be 0~500" CHECK(weight_person > 0 AND weight_person < 500 ),
  CONSTRAINT "raiting must be 1~5"  CHECK(raiting >= 1 AND raiting <= 5),
  CONSTRAINT "invalid name" CHECK (last_name ~ '^[A-Z]{1}[a-z]{1,32}' AND first_name ~ '^[A-Z]{1}[a-z]{1,32}') ,
  UNIQUE(first_name,last_name)
)

INSERT INTO users(first_name,last_name,email,is_male,birthday,weight_person,raiting) VALUES('Maxim','Kuharskiy','test123@test.com',true,'1996-05-28',250.1,4.99)

Drop TABLE users