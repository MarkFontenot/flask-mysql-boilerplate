CREATE DATABASE PlatterDB;
USE PlatterDB;

CREATE TABLE  Recipe_Creator (
    email varchar(100) not null,
    fName varchar(50) not null,
    lName varchar(50) not null,
    creatorID int not null AUTO_INCREMENT,
    PRIMARY KEY (creatorID)
);

CREATE TABLE Admin (
    email varchar(100) not null,
    fName varchar(50) not null,
    lName varchar(50) not null,
    adminID int not null AUTO_INCREMENT,
    PRIMARY KEY (adminID)
);

CREATE TABLE Recipe_Critic (
    email varchar(100) not null,
    fName varchar(50) not null,
    lName varchar(50) not null,
    criticID int not null AUTO_INCREMENT,
    PRIMARY KEY (criticID)
);

CREATE TABLE Following (
    criticID int,
    creatorID int
);
alter table Following add foreign key (criticID) references Recipe_Critic(criticID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Following add foreign key (creatorID) references Recipe_Creator(creatorID) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE Categories (
    course ENUM('Appetizer', 'Entree', 'Dessert'),
    dietType ENUM('Vegan', 'Vegetarian', 'Dairy-free', 'Gluten-free', 'Low-carb'),
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
    recipeID int
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
    recipeID     int
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
    stepNum int not null AUTO_INCREMENT,
    PRIMARY KEY (stepNum)
);
alter table Instruction_Step add foreign key (recipeID) references Instructions(recipeID) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Instruction_Step add foreign key (instructionID) references Instructions(instructionID) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO Admin (email, fName, lName) VALUES ('adammin@gmail.com', 'Adam', 'Min');
INSERT INTO Admin (email, fName, lName) VALUES ('amiller@gmail.com', 'Addison', 'Miller');
INSERT INTO Admin (email, fName, lName) VALUES ('jblankenship0@rambler.ru', 'Jeni', 'Blankenship');

INSERT INTO Recipe_Creator (email, fName, lName) VALUES ('Sandi', 'Benbough', 'sbenbough1@1und1.de');
INSERT INTO Recipe_Creator (email, fName, lName) VALUES ('Aleen', 'Scottrell', 'ascottrell2@soup.io');
INSERT INTO Recipe_Creator (email, fName, lName) VALUES ('Pansie', 'Durrant', 'pdurrant3@telegraph.co.uk');

INSERT INTO Recipe_Critic (email, fName, lName) VALUES ('Maxi', 'Kertess', 'mkertess0@people.com.cn');
INSERT INTO Recipe_Critic (email, fName, lName) VALUES ('Gussi', 'Potebury', 'gpotebury1@technorati.com');
INSERT INTO Recipe_Critic (email, fName, lName) VALUES ('Lana', 'Stubbings', 'lstubbings2@unesco.org');

INSERT INTO Following (criticID, creatorID) VALUES (3, 3);
INSERT INTO Following (criticID, creatorID) VALUES (1, 3);
INSERT INTO Following (criticID, creatorID) VALUES (2, 3);
INSERT INTO Following (criticID, creatorID) VALUES (2, 1);
INSERT INTO Following (criticID, creatorID) VALUES (2, 1);

INSERT INTO Categories (course, dietType) VALUES ('Appetizer', 'Low-carb');
INSERT INTO Categories (course, dietType) VALUES ('Entree', 'Dairy-free');
INSERT INTO Categories (course, dietType) VALUES ('Dessert', 'Gluten-free');
INSERT INTO Categories (course, dietType) VALUES ('Appetizer', 'Vegetarian');
INSERT INTO Categories (course, dietType) VALUES ('Dessert', 'Vegan');

INSERT INTO Cuisine_Origins (origin, description) VALUES ('Italian', 'Caprese salad originated in the 1950s on the island of Capri, Italy as a tribute to the colors of the Italian flag.');
INSERT INTO Cuisine_Origins (origin, description) VALUES ('Middle Eastern', 'Baklava is a sweet pastry that originated in the Middle East and is made with layers of phyllo dough, nuts, and sweet syrup or honey.');
INSERT INTO Cuisine_Origins (origin, description) VALUES ('Mediterranean', 'Grilling chicken with a lemon and herb marinade is a common cooking method in Mediterranean and Middle Eastern cuisines.');

INSERT INTO Recipes (title, servings, difficulty, description, originID, categoryID, creatorID) VALUES
('Baklava', 12, 'Challenging', 'This vegan baklava recipe is a classic Middle Eastern dessert made with layers of crispy phyllo dough, a sweet and nutty filling, and a fragrant honey or maple syrup glaze, making for a delicious and indulgent treat that is perfect for sharing.', 2, 5, 1);
INSERT INTO Recipes (title, servings, difficulty, description, originID, categoryID, creatorID) VALUES
('Caprese Salad', 3, 'Easy', 'This easy and simple Caprese salad recipe is a classic Italian dish that features ripe tomatoes, fresh mozzarella, and fragrant basil leaves drizzled with extra-virgin olive oil and seasoned with salt and pepper, making for a light and refreshing appetizer or side dish.', 1, 1, 3);
INSERT INTO Recipes (title, servings, difficulty, description, originID, categoryID, creatorID) VALUES
('Grilled Lemon-Herb Chicken', 4, 'Moderate', 'This Grilled Lemon-Herb Chicken recipe is a simple and flavorful dairy-free entree that features juicy and tender chicken breasts marinated in a zesty blend of olive oil, lemon, garlic, and fresh herbs.', 3, 2, 2);

# For Baklava
INSERT INTO Ingredients (name) VALUES ('Phyllo dough');
INSERT INTO Ingredients (name) VALUES ('coconut oil');
INSERT INTO Ingredients (name) VALUES ('nuts ');
INSERT INTO Ingredients (name) VALUES ('sugar');
INSERT INTO Ingredients (name) VALUES ('ground cinnamon');
INSERT INTO Ingredients (name) VALUES ('water');
INSERT INTO Ingredients (name) VALUES ('honey ');
INSERT INTO Ingredients (name) VALUES ('vanilla extract');
INSERT INTO Ingredients (name) VALUES ('Lemon zest');

INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (1.0, 'pound', 1, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (1.5, 'cups', 2, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, 'cups finely chopped', 3, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (.33, 'cup', 4, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (1, 'tsp', 5, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (.5, 'cup', 6, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (.5, 'cup', 7, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (1, 'tsp', 8, 1);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (null, 'to taste', 9, 1);

INSERT INTO Instructions (cookTime, prepTime, recipeID) VALUES (30, 60, 1);

INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Preheat your oven to 350°F (175°C) and grease a 9x13 inch baking pan.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Mix together the chopped nuts, sugar, cinnamon, and lemon zest in a bowl and set aside.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Lay the phyllo dough out flat and cut it to fit the baking pan.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Brush the bottom of the pan with melted butter or coconut oil and lay one layer of phyllo dough on top.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Brush the phyllo dough with melted butter or coconut oil and continue layering phyllo and brushing with butter or oil until you have used about half of the phyllo sheets.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Sprinkle half of the nut mixture over the phyllo layers in the pan.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Layer the remaining phyllo sheets on top of the nut mixture, brushing each layer with butter or oil as before.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Sprinkle the remaining nut mixture over the top layer of phyllo.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Cut the baklava into small squares or diamonds with a sharp knife.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Bake the baklava for 50-60 minutes, or until golden brown and crispy.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('While the baklava is baking, mix together the water, honey or maple syrup, and vanilla extract in a saucepan and bring to a boil. Simmer for 10-15 minutes.', 1, 1);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('When the baklava is done, remove it from the oven and immediately pour the hot syrup over the top. Allow the baklava to cool before serving.', 1, 1);

# For Caprese Salad
INSERT INTO Ingredients (name) VALUES ('Ripe Tomatoes');
INSERT INTO Ingredients (name) VALUES ('mozzarella cheese');
INSERT INTO Ingredients (name) VALUES ('basil leaves ');
INSERT INTO Ingredients (name) VALUES ('extra-virgin olive oil');
INSERT INTO Ingredients (name) VALUES ('Salt and pepper');

INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, null, 10, 2);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (8, 'oz', 11, 2);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (null, null, 12, 2);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, 'tbsp', 13, 2);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (null, 'to taste', 14, 2);

INSERT INTO Instructions (cookTime, prepTime, recipeID) VALUES (0, 15, 2);

INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Arrange the tomato and mozzarella slices on a plate, alternating between them.', 2, 2);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Place fresh basil leaves on top of each slice of mozzarella.', 2, 2);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Drizzle the olive oil over the salad.', 2, 2);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Season with salt and pepper, to taste.', 2, 2);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Serve and enjoy your fresh and delicious Caprese salad!', 2, 2);

# For Chicken
INSERT INTO Ingredients (name) VALUES ('boneless, skinless chicken breasts');
INSERT INTO Ingredients (name) VALUES ('olive oil');
INSERT INTO Ingredients (name) VALUES ('Juice and zest of lemon ');
INSERT INTO Ingredients (name) VALUES ('garlic cloves');
INSERT INTO Ingredients (name) VALUES ('chopped fresh thyme');
INSERT INTO Ingredients (name) VALUES ('chopped fresh rosemary');
INSERT INTO Ingredients (name) VALUES ('Salt and pepper');

INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, null, 15, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (8, 'oz', 16, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (null, null, 17, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, 'tbsp', 18, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (null, 'to taste', 19, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (2, null, 20, 3);
INSERT INTO Recipe_Ingredients (amount, unit, ingredientID, recipeID) VALUES (8, 'oz', 21, 3);

INSERT INTO Instructions (cookTime, prepTime, recipeID) VALUES (30, 15, 3);

INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Preheat your grill to medium-high heat.', 3, 3);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('In a bowl, whisk together the olive oil, lemon juice and zest, garlic, thyme, and rosemary.', 3, 3);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Season the chicken breasts with salt and pepper.', 3, 3);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Brush the chicken with the marinade and let it sit for at least 15 minutes.', 3, 3);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Place the chicken on the grill and cook for 5-6 minutes per side, or until the internal temperature reaches 165°F.', 3, 3);
INSERT INTO Instruction_Step (step, instructionID, recipeID) VALUES ('Remove the chicken from the grill and let it rest for a few minutes before slicing and serving.', 3, 3);
