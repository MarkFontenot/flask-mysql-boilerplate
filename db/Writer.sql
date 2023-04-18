CREATE TABLE Moderator(
   id          INTEGER  NOT NULL PRIMARY KEY 
  ,username    VARCHAR(9) NOT NULL
  ,FName       VARCHAR(10) NOT NULL
  ,LName       VARCHAR(7) NOT NULL
  ,yearsActive INTEGER  NOT NULL
  ,numOffenses INTEGER  NOT NULL
);
INSERT INTO Moderator(id,username,FName,LName,yearsActive,numOffenses) VALUES (1,'bkleeman0','Blondell','Kleeman',3,3);
INSERT INTO Moderator(id,username,FName,LName,yearsActive,numOffenses) VALUES (2,'cransome1','Corrina','Ransome',4,1);
INSERT INTO Moderator(id,username,FName,LName,yearsActive,numOffenses) VALUES (3,'vkeemer2','Vidovik','Keemer',4,1);
INSERT INTO Moderator(id,username,FName,LName,yearsActive,numOffenses) VALUES (4,'nminter3','Neysa','Minter',2,3);
INSERT INTO Moderator(id,username,FName,LName,yearsActive,numOffenses) VALUES (5,'hlackham4','Huntington','Lackham',2,1);
