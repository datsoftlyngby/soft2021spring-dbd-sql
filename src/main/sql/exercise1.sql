DROP TABLE IF EXISTS Vets;
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Cities;

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
CREATE SEQUENCE PetSequence; 

CREATE TABLE Pets (
--	id int default nextval('PetSequence') PRIMARY KEY,
	id SERIAL PRIMARY KEY,
	name varchar(20) NOT NULL,
	age int NOT NULL
	);

CREATE TABLE Cats (
	id int PRIMARY KEY REFERENCES Pets NOT NULL,
	lifeCount int DEFAULT (9)
	);

CREATE TABLE Dogs (
	id int PRIMARY KEY REFERENCES Pets NOT NULL,
	barkPitch char(2)
	);

CREATE VIEW ALL_CATS AS
    SELECT P.*, C.lifeCount FROM PETS AS P JOIN CATS AS C ON P.id = C.id;

CREATE VIEW ALL_DOGS AS
    SELECT P.*, D.barkPitch FROM PETS AS P JOIN DOGS AS D ON P.id = D.id;

