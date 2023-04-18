CREATE TABLE mytable(
   writer_id INTEGER  NOT NULL
  ,mod_id    INTEGER  NOT NULL

PRIMARY KEY (writer_id, mod_id),

    FOREIGN KEY (writer_id)
        REFERENCES Writer (id),
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,1);
INSERT INTO mytable(writer_id,mod_id) VALUES (4,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (2,1);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (4,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (2,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (3,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (4,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (5,1);
INSERT INTO mytable(writer_id,mod_id) VALUES (3,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (2,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (5,2);
INSERT INTO mytable(writer_id,mod_id) VALUES (3,1);
INSERT INTO mytable(writer_id,mod_id) VALUES (5,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (2,3);
INSERT INTO mytable(writer_id,mod_id) VALUES (1,1);
INSERT INTO mytable(writer_id,mod_id) VALUES (4,3);
