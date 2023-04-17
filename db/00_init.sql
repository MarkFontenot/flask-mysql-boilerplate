-- # DROP DATABASE QuizDB;
CREATE DATABASE QuizDB;
SHOW DATABASES;
USE QuizDB;


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
    id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
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
    URL              VARCHAR(1024), --  many security protocols and recommendations state that
    -- maxQueryStrings on a server should be set to a maximum character limit of 1024
    statsLastUpdated DATETIME,
    numTimesTaken    INT      DEFAULT 0,
    percentAbove80   INT,
    writer_id        INT                            NOT NULL,
    title            VARCHAR(50)                    NOT NULL,
    description      VARCHAR(50),

    FOREIGN KEY (writer_id)
        REFERENCES Writer (id)
);


CREATE TABLE Question
(
    id            INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type          VARCHAR(500),
    dateAdded     DATETIME,
    lastUpdated   DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    quiz_id       INT                            NOT NULL,
    question_text VARCHAR(500)                   NOT NULL,

    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id)
);


CREATE TABLE Response
(
    id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    selection   VARCHAR(500),
    dateAdded   DATETIME,
    quiz_id     INT                            NOT NULL,
    question_id INT                            NOT NULL,
    user_id     INT                            NOT NULL,

    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id),
    FOREIGN KEY (question_id)
        REFERENCES Question (id),
    FOREIGN KEY (user_id)
        REFERENCES User (id)
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
        REFERENCES Quiz (id),
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
        REFERENCES User (id),
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);

CREATE TABLE ContactedUsers
(
    user_id INT NOT NULL,
    mod_id  INT NOT NULL,

    PRIMARY KEY (user_id, mod_id),

    FOREIGN KEY (user_id)
        REFERENCES User (id),
    FOREIGN KEY (mod_id)
        REFERENCES Moderator (id)
);


CREATE TABLE UserQuizzes
(
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,

    PRIMARY KEY (user_id, quiz_id),

    FOREIGN KEY (user_id)
        REFERENCES User (id),
    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (id)
);


CREATE TABLE ResponseOptions
(
    question_id INT NOT NULL,
    option_text VARCHAR(500),
    correct     BOOLEAN,

    PRIMARY KEY (question_id, option_text),

    FOREIGN KEY (question_id)
        REFERENCES Question (id)
);

-- Some fake data
-- INSERT INTO Moderator (id, username, FName, LName)
-- VALUES (1, 'mod1', 'Number', 'One'),
--        (2, 'mod2', 'Num', 'Two');

-- INSERT INTO User (id, username, FName, LName, email)
-- VALUES (1, 'user1', 'Bob', 'Moss', 'bob@mail.com'),
--        (2, 'user2', 'Alice', 'Lovelace', 'alice@mail.com'),
--        (3, 'user3', 'John', 'Doe', 'john@mail.com');

-- INSERT INTO Writer (id, username, FName, LName)
-- VALUES (1, 'writer1', 'Gabrielle', 'Zevin'),
--        (2, 'writer2', 'Kazuo', 'Ishiguro'),
--        (3, 'writer3', 'Amor', 'Towles');

-- INSERT INTO Quiz (id, writer_id, title)
-- VALUES (1, 1, 'Pets'),
--        (2, 1, 'State Capitals'),
--        (3, 2, 'Country Capitals');

-- INSERT INTO Question (id, type, quiz_id, question_text)
-- VALUES (1, 'select_all', 1, 'What pets do you have?'),
--        (2, 'multiple_choice', 1, 'Which is your favorite?'),
--        (3, 'multiple_choice', 2, 'What is the capital of Massachusetts?'),
--        (4, 'multiple_choice', 2, 'What is the capital of New Hampshire?'),
--        (5, 'multiple_choice', 2, 'What is the capital of Vermont?'),
--        (6, 'multiple_choice', 3, 'What is the capital of USA?'),
--        (7, 'multiple_choice', 3, 'What is the capital of France?');

-- INSERT INTO ResponseOptions (question_id, option_text)
-- VALUES (1, 'dog'),
--        (1, 'cat'),
--        (1, 'hamster'),
--        (2, 'dog'),
--        (2, 'cat'),
--        (2, 'hamster'),
--        (3, 'Boston'),
--        (3, 'Atlanta'),
--        (4, 'Concord'),
--        (4, 'Boston'),
--        (5, 'Montpelier'),
--        (5, 'Concord'),
--        (6, 'Washington DC'),
--        (6, 'New York City'),
--        (7, 'Paris'),
--        (7, 'Marseille');

-- INSERT INTO Response (id, selection, quiz_id, question_id, user_id)
-- VALUES (1, 'dog', 1, 1, 1),
--        (2, 'cat', 1, 1, 1),
--        (3, 'dog', 1, 2, 1),
--        (4, 'dog', 1, 1, 2),
--        (5, 'cat', 1, 1, 2),
--        (6, 'dog', 1, 2, 2),
--        (7, 'Boston', 2, 3, 2),
--        (8, 'Concord', 2, 4, 2),
--        (9, 'Montpelier', 2, 5, 2),
--        (10, 'Washington DC', 3, 6, 3),
--        (11, 'Paris', 3, 7, 3);

-- INSERT INTO ContactedWriters (writer_id, mod_id) VALUE (1, 1);
-- INSERT INTO FlaggedQuizzes (quiz_id, mod_id) VALUE (1, 1);
-- INSERT INTO FlaggedUsers (user_id, mod_id, num_offenses) VALUE (1, 1, 1);
-- INSERT INTO ContactedUsers (user_id, mod_id) VALUE (1, 1);

-- INSERT INTO UserQuizzes (user_id, quiz_id)
-- VALUES (1, 1),
--        (2, 1),
--        (2, 2),
--        (3, 3);
