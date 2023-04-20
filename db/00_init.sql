-- DROP DATABASE quizdb;
CREATE DATABASE quizdb;
SHOW DATABASES;
USE quizdb;


CREATE TABLE Moderator
(
    id       INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(50)                    NOT NULL,
    FName    VARCHAR(50)                    NOT NULL,
    LName    VARCHAR(50)                    NOT NULL
);


CREATE TABLE Writer
(
    id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username    VARCHAR(50)                    NOT NULL,
    FName       VARCHAR(50)                    NOT NULL,
    LName       VARCHAR(50)                    NOT NULL,
    yearsActive INT DEFAULT 0                  NOT NULL,
    numOffenses INT DEFAULT 0                  NOT NULL
);

CREATE TABLE User
(
    user_id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username    VARCHAR(50)                    NOT NULL,
    FName       VARCHAR(50)                    NOT NULL,
    LName       VARCHAR(50)                    NOT NULL,
    numOffenses INT DEFAULT 0                  NOT NULL,
    email       VARCHAR(50)                    NOT NULL
);


CREATE TABLE Quiz
(
    id               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    status           VARCHAR(50),   -- active, draft, archived
    category         VARCHAR(50),
    dateAdded        DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastUpdated      DATEtime DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    numOffenses      INT,
    URL              VARCHAR(2083),
    statsLastUpdated DATETIME,
    numTimesTaken    INT      DEFAULT 0,
    percentAbove80   INT,
    writer_id        INT                            NOT NULL,
    title            VARCHAR(255)                    NOT NULL,
    description      VARCHAR(255),

    FOREIGN KEY (writer_id)
        REFERENCES Writer (id)
);


CREATE TABLE Question
(
    id            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type          VARCHAR(500),
    dateAdded     DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastUpdated   DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    quiz_id       INT                            NOT NULL,
    question_text VARCHAR(500)                   NOT NULL,

    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Response
(
    id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    selection   VARCHAR(500),
    dateAdded   DATETIME DEFAULT CURRENT_TIMESTAMP,
    quiz_id     INT                            NOT NULL,
    question_id INT                            NOT NULL,
    user_id     INT                            NOT NULL,

    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (question_id)
        REFERENCES Question (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id)
        REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE ContactedWriters
(
    writer_id INT NOT NULL,
    mod_id    INT NOT NULL,

    PRIMARY KEY (writer_id, mod_id),

    FOREIGN KEY (writer_id)
        REFERENCES Writer (id),
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);

CREATE TABLE FlaggedQuizzes
(
    quiz_id INT NOT NULL,
    mod_id  INT NOT NULL,

    PRIMARY KEY (quiz_id, mod_id),

    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);


CREATE TABLE FlaggedUsers
(
    user_id      INT NOT NULL,
    mod_id       INT NOT NULL,
    num_offenses INT NOT NULL,

    PRIMARY KEY (user_id, mod_id, num_offenses),

    FOREIGN KEY (user_id)
        REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);

CREATE TABLE ContactedUsers
(
    user_id INT NOT NULL,
    mod_id  INT NOT NULL,

    PRIMARY KEY (user_id, mod_id),

    FOREIGN KEY (user_id)
        REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);

CREATE TABLE UserQuizzes
(
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,

    PRIMARY KEY (user_id, quiz_id),

    FOREIGN KEY (user_id)
        REFERENCES User (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ResponseOptions
(
    question_id INT NOT NULL,
    option_text VARCHAR(500),
    correct BOOLEAN,

    PRIMARY KEY (question_id, option_text),

    FOREIGN KEY (question_id)
        REFERENCES Question (id) ON DELETE CASCADE ON UPDATE CASCADE
);
