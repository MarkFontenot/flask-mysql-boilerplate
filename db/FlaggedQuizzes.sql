CREATE TABLE mytable(
   quiz_id      INTEGER  NOT NULL
  ,mod_id       INTEGER  NOT NULL
  ,num_offenses INTEGER  NOT NULL

,PRIMARY KEY (user_id, mod_id, num_offenses),

    FOREIGN KEY (user_id)
        REFERENCES User (id)
    ,FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (27,1,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (1,1,1);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (23,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (21,1,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (19,2,1);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (29,3,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (24,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (7,2,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (9,3,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (20,3,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (30,2,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (19,1,1);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (12,2,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (28,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (24,3,1);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (7,1,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (7,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (14,3,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (17,1,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (25,3,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (28,1,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (9,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (20,1,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (1,3,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (8,2,1);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (29,3,2);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (30,2,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (4,1,0);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (11,1,3);
INSERT INTO mytable(quiz_id,mod_id,num_offenses) VALUES (3,2,1);
