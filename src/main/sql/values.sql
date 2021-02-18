INSERT INTO PETS (name, age) VALUES ('Felix', 1);
INSERT INTO CATS (id) VALUES (1);

INSERT INTO PETS (name, age) VALUES ('Rufus', 2);
INSERT INTO DOGS (id, barkPitch) VALUES(2, 'C2');

select * from ALL_DOGS;

INSERT INTO PETS (name, age) VALUES ('Chico', 20) RETURNING id;

WITH NEW_DOGS AS (
    INSERT INTO PETS (name, age) VALUES ('Puller', 8) RETURNING id
	)
INSERT INTO DOGS (id, barkPitch) SELECT id, 'E3' FROM NEW_DOGS;

select * from ALL_DOGS;

INSERT INTO ALL_DOGS (id, name, age, barkPitch) VALUES (17, 'Kvast', 10, 'C2');

