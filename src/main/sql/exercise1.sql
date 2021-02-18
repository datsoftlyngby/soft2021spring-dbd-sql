DROP TABLE IF EXISTS Vets;
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Cities;

DROP TABLE IF EXISTS CAT_DATA CASCADE;
DROP TABLE IF EXISTS DOG_DATA CASCADE;
DROP TABLE IF EXISTS PET_DATA;

---

CREATE TABLE Cities (
    citycode int PRIMARY KEY NOT NULL,
    name varchar(20) NOT NULL
    );


CREATE TABLE Addresses (
    address_id SERIAL PRIMARY KEY,
    street varchar(100) NOT NULL,
    city_code int REFERENCES Cities NOT NULL --,
    -- FOREIGN KEY (fk_zipcode)
    --    REFERENCES City (zipcode)
    );


CREATE TABLE Vets (
    vet_cvr char(8) PRIMARY KEY,
    name varchar(80) NOT NULL,
    address_id int REFERENCES Addresses
    );

--
-- CREATE SEQUENCE PetSequence; 

CREATE TABLE PET_DATA (
--	id int default nextval('PetSequence') PRIMARY KEY,
	id SERIAL PRIMARY KEY,
	name varchar(20) NOT NULL,
	age int NOT NULL
	);

CREATE TABLE CAT_DATA (
	id int PRIMARY KEY REFERENCES PET_DATA NOT NULL,
	lifeCount int DEFAULT (9)
	);

CREATE TABLE DOG_DATA (
	id int PRIMARY KEY REFERENCES PET_DATA NOT NULL,
	barkPitch char(2)
	);

CREATE VIEW CATS AS
    SELECT P.*, C.lifeCount FROM PET_DATA AS P JOIN CAT_DATA AS C ON P.id = C.id;

CREATE OR REPLACE VIEW DOGS AS
    SELECT P.*, D.barkPitch, 7*P.age AS dog_age
	FROM PET_DATA AS P 
		JOIN DOG_DATA AS D ON P.id = D.id;
	
CREATE OR REPLACE VIEW PETS AS
    SELECT P.*, C.lifeCount, D.barkPitch
	FROM PET_DATA AS P 
		LEFT OUTER JOIN CAT_DATA AS C ON P.id = C.id
		LEFT OUTER JOIN DOG_DATA AS D ON P.id = D.id;


