CREATE TABLE mytable(
   user_id INTEGER  NOT NULL
  ,mod_id  INTEGER  NOT NULL
    PRIMARY KEY (user_id, mod_id)

   ,FOREIGN KEY (user_id)
        REFERENCES User (id),
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);
INSERT INTO mytable(user_id,mod_id) VALUES (3,1);
INSERT INTO mytable(user_id,mod_id) VALUES (7,2);
INSERT INTO mytable(user_id,mod_id) VALUES (2,3);
INSERT INTO mytable(user_id,mod_id) VALUES (6,3);
INSERT INTO mytable(user_id,mod_id) VALUES (9,3);
INSERT INTO mytable(user_id,mod_id) VALUES (6,2);
INSERT INTO mytable(user_id,mod_id) VALUES (2,1);
INSERT INTO mytable(user_id,mod_id) VALUES (4,3);
INSERT INTO mytable(user_id,mod_id) VALUES (17,3);
INSERT INTO mytable(user_id,mod_id) VALUES (16,1);
