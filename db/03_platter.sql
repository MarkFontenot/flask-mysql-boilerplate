CREATE DATABASE PlatterDB;
USE PlatterDB;

CREATE TABLE  Recipe_Creator (
    email varchar(100) not null unique,
    fName varchar(50) not null,
    lName varchar(50) not null,
    creatorID int not null AUTO_INCREMENT,
    PRIMARY KEY (creatorID)
);

CREATE TABLE Admin (
    email varchar(100) not null unique,
    fName varchar(50) not null,
    lName varchar(50) not null,
    adminID int not null AUTO_INCREMENT,
    PRIMARY KEY (adminID)
);

CREATE TABLE Recipe_Critic (
    email varchar(100) not null unique,
    fName varchar(50) not null,
    lName varchar(50) not null,
    criticID int not null AUTO_INCREMENT,
    PRIMARY KEY (criticID)
);

CREATE TABLE Following (
    criticID int,
    creatorID int,
    PRIMARY KEY (criticID, creatorID)
);
alter table Following add foreign key (criticID) references Recipe_Critic(criticID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Following add foreign key (creatorID) references Recipe_Creator(creatorID) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE Categories (
    course varchar(50) not null,
    dietType varchar(50) not null,
    categoryID int not null AUTO_INCREMENT,
    PRIMARY KEY (categoryID)
);

CREATE TABLE Cuisine_Origins (
    origin varchar(56) not null,
    description varchar(200),
    originID int not null AUTO_INCREMENT,
    PRIMARY KEY (originID)
);

CREATE TABLE Recipes (
    title varchar(50) not null,
    servings int not null,
    difficulty ENUM('Easy', 'Moderate', 'Challenging'),
    description varchar(500) not null,
    originID int,
    categoryID int,
    creatorID int,
    date_created datetime DEFAULT CURRENT_TIMESTAMP,
    recipeID int not null AUTO_INCREMENT,
    PRIMARY KEY (recipeID)
);
alter table Recipes add foreign key (originID) references Cuisine_Origins(originID) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table Recipes add foreign key (categoryID) references Categories(categoryID) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table Recipes add foreign key (creatorID) references Recipe_Creator(creatorID) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE Bookmarks (
    criticID int,
    recipeID int,
    PRIMARY KEY (criticID, recipeID)
);
alter table Bookmarks add foreign key (criticID) references Recipe_Critic(criticID) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table Bookmarks add foreign key (recipeID) references Recipes(recipeID) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE Reviews (
    stars int CHECK (stars > 0 AND stars < 6) not null,
    comment varchar(300) not null,
    criticID int,
    recipeID int,
    date_reviewed datetime DEFAULT CURRENT_TIMESTAMP,
    reviewID int not null AUTO_INCREMENT,
    PRIMARY KEY (reviewID)
);
alter table Reviews add foreign key (criticID) references Recipe_Critic(criticID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Reviews add foreign key (recipeID) references Recipes(recipeID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Ingredients (
    name varchar(100) not null,
    ingredientID int not null AUTO_INCREMENT,
    PRIMARY KEY (ingredientID)
);

CREATE TABLE Recipe_Ingredients
(
    amount       decimal,
    unit         varchar(20),
    ingredientID int,
    recipeID     int,
    PRIMARY KEY (ingredientID, recipeID)
);
alter table Recipe_Ingredients add foreign key (ingredientID) references Ingredients(ingredientID) ON DELETE RESTRICT ON UPDATE CASCADE;
alter table Recipe_Ingredients add foreign key (recipeID) references Recipes(recipeID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Instructions (
    cookTime int not null,
    prepTime int not null,
    recipeID int,
    instructionID int not null AUTO_INCREMENT,
    PRIMARY KEY (instructionID)
);
alter table Instructions add foreign key (recipeID) references Recipes(recipeID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Instruction_Step (
    step varchar(200) not null,
    instructionID int,
    recipeID int,
    stepNum int not null DEFAULT 1,
    PRIMARY KEY (stepNum, recipeID, instructionID)
);
alter table Instruction_Step add foreign key (recipeID) references Instructions(recipeID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Instruction_Step add foreign key (instructionID) references Instructions(instructionID) ON DELETE CASCADE ON UPDATE CASCADE;
