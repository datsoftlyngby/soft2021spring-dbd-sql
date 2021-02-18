INSERT INTO PET_DATA (name, age) VALUES ('Felix', 1);
INSERT INTO CAT_DATA (id) VALUES (1);

INSERT INTO PET_DATA (name, age) VALUES ('Rufus', 2);
INSERT INTO DOG_DATA (id, barkPitch) VALUES(2, 'C2');

select * from DOGS;
select * FROM CATS;

-- INSERT INTO PET_DATA (name, age) VALUES ('Chico', 20) RETURNING id;
-- INSERT INTO DOG_DATA VALUES (5, 'E4');

WITH NEW_DOGS AS (
    INSERT INTO PET_DATA (name, age) VALUES ('Puller', 8) RETURNING id
	)
INSERT INTO DOG_DATA (id, barkPitch) SELECT id, 'E3' FROM NEW_DOGS;

select * from DOGS;
SELECT * FROM CATS;
select * from PET_DATA;

SELECT * FROM PETS;



-- INSERT INTO DOGS (id, name, age, barkPitch) VALUES (17, 'Kvast', 10, 'C2');

