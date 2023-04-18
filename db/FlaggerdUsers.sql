CREATE TABLE mytable(
   user_id      INTEGER  NOT NULL
  ,mod_id       INTEGER  NOT NULL
  ,num_offenses INTEGER  NOT NULL
  ,PRIMARY KEY (user_id, mod_id, num_offenses),

    FOREIGN KEY (user_id)
        REFERENCES User (id)
    ,FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (20,2,3);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (1,2,3);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (4,2,3);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (6,1,2);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (11,3,2);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (1,3,2);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (7,3,2);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (6,1,1);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (18,1,2);
INSERT INTO mytable(user_id,mod_id,num_offenses) VALUES (5,2,3);
