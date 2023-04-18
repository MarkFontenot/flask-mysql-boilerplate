CREATE TABLE mytable(
   user_id INTEGER  NOT NULL 
  ,quiz_id INTEGER  NOT NULL
  
  ,PRIMARY KEY (user_id, quiz_id)

  , FOREIGN KEY (user_id)
        REFERENCES User (id)
  , FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id)
);
INSERT INTO mytable(user_id,quiz_id) VALUES (16,11);
INSERT INTO mytable(user_id,quiz_id) VALUES (5,4);
INSERT INTO mytable(user_id,quiz_id) VALUES (4,29);
INSERT INTO mytable(user_id,quiz_id) VALUES (2,15);
INSERT INTO mytable(user_id,quiz_id) VALUES (13,12);
INSERT INTO mytable(user_id,quiz_id) VALUES (9,30);
INSERT INTO mytable(user_id,quiz_id) VALUES (3,10);
INSERT INTO mytable(user_id,quiz_id) VALUES (1,17);
INSERT INTO mytable(user_id,quiz_id) VALUES (3,20);
INSERT INTO mytable(user_id,quiz_id) VALUES (16,29);
INSERT INTO mytable(user_id,quiz_id) VALUES (12,17);
INSERT INTO mytable(user_id,quiz_id) VALUES (2,6);
INSERT INTO mytable(user_id,quiz_id) VALUES (4,17);
INSERT INTO mytable(user_id,quiz_id) VALUES (1,25);
INSERT INTO mytable(user_id,quiz_id) VALUES (17,4);
INSERT INTO mytable(user_id,quiz_id) VALUES (15,5);
INSERT INTO mytable(user_id,quiz_id) VALUES (1,6);
INSERT INTO mytable(user_id,quiz_id) VALUES (1,11);
INSERT INTO mytable(user_id,quiz_id) VALUES (20,27);
INSERT INTO mytable(user_id,quiz_id) VALUES (19,17);
