CREATE DATABASE DynamoMealsV2;

USE DynamoMealsV2;

create table DynamoMealsV2.Accounts (
	account_id VARCHAR(50) PRIMARY KEY,
	account_num VARCHAR(50) NOT NULL,
	vendor VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('jhd-685-5198',18481470477022,'jcb','Drucie Spittles','8 Crest Line Crossing');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('lva-455-8172',73698057902058,'jcb','Derby Quainton','8526 Kensington Crossing');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('wgr-716-4162',17423448691874,'jcb','Stefan Beddall','135 Schiller Way');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('zrq-191-7539',34865957781885,'visa-electron','Robbert Milsted','78684 Bultman Avenue');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('olq-930-6117',77743476505016,'maestro','Harwilll Osipenko','117 Summit Park');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('rly-132-0556',88063541064298,'diners-club-enroute','Kirsteni Mozzi','7875 Mayer Circle');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('ebc-995-8084',41872595862038,'jcb','Lisbeth Scrowston','72 Anthes Park');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('bxz-641-2981',36901657311068,'mastercard','Andrej Anthony','26251 Donald Drive');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('tss-075-2715',40233014629610,'jcb','Gaye Lanegran','067 Del Sol Alley');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('jpd-197-9740',93827229346383,'jcb','Harmonia Abrashkin','47 Division Court');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('jnh-304-4709',54078017611439,'jcb','Coleen Prestland','86012 6th Lane');
INSERT INTO Accounts(account_id,account_num,vendor,name,address) VALUES ('dox-693-4876',24334935106546,'jcb','Charmaine Braniff','01039 4th Road');

create table DynamoMealsV2.Users (
	user_id VARCHAR(50) PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	gender VARCHAR(50),
	account_created DATE NOT NULL,
	last_login DATE,
	private VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	account_id VARCHAR(50) NOT NULL,
	CONSTRAINT fk_1 FOREIGN KEY (account_id) REFERENCES Accounts (account_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (8761353670,'dwilfing0','Delainey','Wilfing','2002-10-09','Male','2023-03-29','2023-05-11','true','dwilfing0@jalbum.net','jhd-685-5198');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (4876321349,'dgaunson1','Denice','Gaunson','1948-12-02','Female','2023-01-19','2023-05-10','false','dgaunson1@blogs.com','lva-455-8172');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (3210177218,'mcarles2','Menard','Carles','1987-10-26','Male','2023-01-14','2023-04-11','true','mcarles2@dailymotion.com','wgr-716-4162');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (6903108375,'cmassey3','Culver','Massey','1951-03-12','Male','2023-02-02','2023-05-03','true','cmassey3@yellowbook.com','zrq-191-7539');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (5652806794,'rwashbrook4','Ryan','Washbrook','1950-07-30','Male','2023-03-23','2023-05-28','true','rwashbrook4@eepurl.com','olq-930-6117');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (6035314078,'gfredson5','Galina','Fredson','1948-01-06','Female','2023-02-08','2023-05-02','true','gfredson5@prnewswire.com','rly-132-0556');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (0530379684,'fchalk6','Frederick','Chalk','1945-03-06','Male','2023-03-06','2023-05-13','false','fchalk6@homestead.com','ebc-995-8084');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (6666408381,'ooyley7','Olva','Oyley','1959-12-02','Female','2023-04-01','2023-06-24','false','ooyley7@mapquest.com','bxz-641-2981');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (1787437179,'cmatzl8','Constancy','Matzl','1961-10-06','Female','2023-03-27','2023-04-08','false','cmatzl8@eventbrite.com','tss-075-2715');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (3943310720,'iskuce9','Igor','Skuce','1955-06-13','Male','2023-01-16','2023-04-18','false','iskuce9@digg.com','jpd-197-9740');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (8686381072,'cdonnetta','Cecil','Donnett','1987-07-13','Female','2023-01-14','2023-04-26','true','cdonnetta@tiny.cc','jnh-304-4709');
INSERT INTO Users(user_id,username,first_name,last_name,date_of_birth,gender,account_created,last_login,private,email,account_id) VALUES (4569140322,'jgrelkab','Jesse','Grelka','1983-01-11','Male','2023-03-10','2023-06-02','false','jgrelkab@wunderground.com','dox-693-4876');

create table DynamoMealsV2.Chefs (
	chef_id VARCHAR(50) PRIMARY KEY,
	user_id VARCHAR(50) NOT NULL,
	description VARCHAR(50),
	address VARCHAR(50) NOT NULL,
	CONSTRAINT fk_2 FOREIGN KEY (user_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-7875749874',8761353670,'Ergonomic 24/7 portal','056 Continental Circle');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-5869604817',4876321349,'Switchable human-resource hub','6992 Manufacturers Court');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-7164354370',3210177218,'Diverse context-sensitive attitude','6 Green Ridge Crossing');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-2633786937',6903108375,'Expanded asynchronous moratorium','3 Sloan Crossing');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-0306640423',5652806794,'Persistent user-facing protocol','2378 Manitowish Terrace');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-1796940861',6035314078,'Visionary radical superstructure','39 Hollow Ridge Parkway');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-7053122169',0530379684,'Profit-focused multi-state middleware','6 Pankratz Drive');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-9823785908',6666408381,'Seamless fault-tolerant standardization','51 Cottonwood Place');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-5039725977',1787437179,'Digitized optimizing model','2939 Mendota Point');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-4471120964',3943310720,'Virtual static hierarchy','758 Nova Park');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-3096234415',8686381072,'Fundamental eco-centric groupware','33209 Burning Wood Trail');
INSERT INTO Chefs(chef_id,user_id,description,address) VALUES ('chef-0728410444',4569140322,'Sharable multi-state core','1960 Swallow Way');

create table DynamoMealsV2.Drivers (
	driver_id VARCHAR(50) PRIMARY KEY,
	user_id VARCHAR(50) NOT NULL,
	car_make VARCHAR(50),
	license_plate VARCHAR(50) NOT NULL,
	available VARCHAR(50) NOT NULL,
	CONSTRAINT fk_3 FOREIGN KEY (user_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-7602000741',8761353670,'Mercedes-Benz','2q3-4K2','true');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-0044649772',4876321349,'Mercedes-Benz','AZ3-MvJ','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-1262688841',3210177218,'Volkswagen','nv4-s9E','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-5135519555',6903108375,'Hummer','TPl-qRc','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-5835394224',5652806794,'Buick','ZR2-aoz','true');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-5957762684',6035314078,'Ford','LUZ-J7z','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-0327100641',0530379684,'Oldsmobile','wUe-iuG','true');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-3584323207',6666408381,'Lexus','q5P-liS','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-4113262432',1787437179,'Dodge','3dM-hPL','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-2833491848',3943310720,'Mazda','kM5-3MO','true');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-3703669094',8686381072,'Jaguar','ZPX-1Ww','false');
INSERT INTO Drivers(driver_id,user_id,car_make,license_plate,available) VALUES ('driver-4546280011',4569140322,'Ford','Qih-Pph','false');

create table DynamoMealsV2.Consumers (
	consumer_id VARCHAR(50) PRIMARY KEY,
	user_id VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	CONSTRAINT fk_4 FOREIGN KEY (user_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-4115839819',8761353670,'307 North Road');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-6230596171',4876321349,'752 Badeau Plaza');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-8765991669',3210177218,'57 Mosinee Road');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-8624772349',6903108375,'6016 Melrose Alley');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-2858977612',5652806794,'55958 Forest Dale Drive');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-9311283308',6035314078,'480 Reinke Park');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-3444503604',0530379684,'44 Continental Street');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-8603585179',6666408381,'82 Garrison Pass');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-8055338372',1787437179,'82 Arrowood Street');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-7287119693',3943310720,'62 Northridge Court');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-0231141671',8686381072,'769 Sugar Alley');
INSERT INTO Consumers(consumer_id,user_id,address) VALUES ('consumer-6783275722',4569140322,'98 Ridgeview Crossing');

create table DynamoMealsV2.Posts (
	post_id VARCHAR(50) PRIMARY KEY,
	chef_id VARCHAR(50) NOT NULL,
	title VARCHAR(50),
	description VARCHAR(50),
	currently_available VARCHAR(50) NOT NULL,
	expected_time VARCHAR(50),
	need_delivery VARCHAR(50) NOT NULL,
	price VARCHAR(50) NOT NULL,
	CONSTRAINT fk_5 FOREIGN KEY (chef_id) REFERENCES Chefs (chef_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('rzr196044484','chef-7875749874','analyzing','description','true','9:40','true','$28.06');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('cnw352274004','chef-5869604817','database','description','true','7:01','true','$95.75');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('rst248404468','chef-7164354370','migration','description','false','10:58','false','$55.23');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('yxh438557827','chef-2633786937','access','description','true','8:47','true','$98.40');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('jkt408438930','chef-0306640423','functionalities','description','true','4:21','true','$63.07');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('wfn922984184','chef-1796940861','frame','description','true','4:12','false','$57.16');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('mfy402387120','chef-7053122169','analyzing','description','true','2:06','true','$52.50');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('hdg991375001','chef-9823785908','Team-oriented','description','true','1:21','true','$10.77');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('pde019813118','chef-5039725977','incremental','description','true','2:02','true','$99.35');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('zuv343504096','chef-4471120964','portal','description','false','8:22','true','$93.43');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('hfo669891937','chef-3096234415','Visionary','description','true','4:29','true','$39.75');
INSERT INTO Posts(post_id,chef_id,title,description,currently_available,expected_time,need_delivery,price) VALUES ('lav921517714','chef-0728410444','system engine','description','true','5:58','false','$96.51');

create table DynamoMealsV2.FoodTag (
	post_id VARCHAR(50),
	tag_name VARCHAR(50),
	primary key(post_id, tag_name),
	CONSTRAINT fk_6 foreign key (post_id) REFERENCES Posts (post_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO FoodTag(post_id,tag_name) VALUES ('rzr196044484','Eggplant - Asian');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('cnw352274004','Mop Head - Cotton, 24 Oz');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('rst248404468','Soup - Campbells Chicken');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('yxh438557827','Mcguinness - Blue Curacao');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('jkt408438930','Wine - Champagne Brut Veuve');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('wfn922984184','Capers - Pickled');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('mfy402387120','Soupcontfoam16oz 116con');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('hdg991375001','Graham Cracker Mix');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('pde019813118','Skirt - 24 Foot');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('zuv343504096','Garam Masala Powder');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('hfo669891937','Onions - White');
INSERT INTO FoodTag(post_id,tag_name) VALUES ('lav921517714','Sour Cream');

create table DynamoMealsV2.Orders (
	order_id VARCHAR(50) PRIMARY KEY,
	post_id VARCHAR(50) NOT NULL,
	consumer_id VARCHAR(50) NOT NULL,
	time_ordered VARCHAR(50) NOT NULL,
	CONSTRAINT fk_7 foreign key (post_id) REFERENCES Posts (post_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_8 foreign key (consumer_id) REFERENCES Consumers (consumer_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('l1f8q3m2y0h3','rzr196044484','consumer-4115839819','5:08 AM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('t5v3s3v1v0n3','cnw352274004','consumer-6230596171','2:47 AM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('t8x1x9n6a2v4','rst248404468','consumer-8765991669','8:39 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('i0m5q4l9x9e1','yxh438557827','consumer-8624772349','11:21 AM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('e2e8k2a3a3d5','jkt408438930','consumer-2858977612','6:23 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('w9a6o9r2j0z4','wfn922984184','consumer-9311283308','2:16 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('m7n8v1a5m2h7','mfy402387120','consumer-3444503604','10:29 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('v2v0w9p4m2c3','hdg991375001','consumer-8603585179','12:37 AM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('u8p7g7z8k8g0','pde019813118','consumer-8055338372','10:10 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('a8g5g5q5j2k4','zuv343504096','consumer-7287119693','12:30 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('y6z3d0p5e0s3','hfo669891937','consumer-0231141671','12:01 PM');
INSERT INTO Orders(order_id,post_id,consumer_id,time_ordered) VALUES ('j5g4t0a8x9n8','lav921517714','consumer-6783275722','5:27 AM');

create table DynamoMealsV2.PostReviews (
	post_review_id VARCHAR(50) PRIMARY KEY,
	post_id VARCHAR(50) NOT NULL,
	consumer_id VARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	description VARCHAR(50),
	CONSTRAINT fk_9 foreign key (post_id) REFERENCES Posts (post_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_10 foreign key (consumer_id) REFERENCES Consumers (consumer_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('kc482gyj853','rzr196044484','consumer-4115839819',4,'Organized 4th generation architecture');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('wn658zok336','cnw352274004','consumer-6230596171',4,'Compatible content-based model');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('zm268jci756','rst248404468','consumer-8765991669',2,'Balanced fault-tolerant open system');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('pl204ziy304','yxh438557827','consumer-8624772349',4,'Pre-emptive multimedia infrastructure');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('wj341vgt739','jkt408438930','consumer-2858977612',4,'Phased impactful encryption');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('ix931uhu257','wfn922984184','consumer-9311283308',3,'Future-proofed interactive architecture');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('me168tnm215','mfy402387120','consumer-3444503604',5,'User-centric radical groupware');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('pd469bwg847','hdg991375001','consumer-8603585179',3,'Proactive holistic success');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('mp069awr669','pde019813118','consumer-8055338372',3,'Automated methodical artificial intelligence');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('dm885abt852','zuv343504096','consumer-7287119693',4,'Fundamental maximized help-desk');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('um732lro047','hfo669891937','consumer-0231141671',3,'Intuitive directional installation');
INSERT INTO PostReviews(post_review_id,post_id,consumer_id,rating,description) VALUES ('sq591tno319','lav921517714','consumer-6783275722',5,'Progressive impactful support');

create table DynamoMealsV2.ChefReview (
	chef_review_id VARCHAR(50) PRIMARY KEY,
	reviewer_id VARCHAR(50) NOT NULL,
	chef_id VARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	description VARCHAR(50),
	CONSTRAINT fk_11 foreign key (reviewer_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_12 foreign key (chef_id) REFERENCES Chefs (chef_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('d7t9q4o3i7p4',8761353670,'chef-7875749874',4,'Multi-channelled transitional superstructure');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('v8m5o6r0z7z6',4876321349,'chef-5869604817',3,'Pre-emptive needs-based throughput');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('d3i8m1n8t0b8',3210177218,'chef-7164354370',5,'Profit-focused intangible orchestration');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('b1a4a0a8b4x8',6903108375,'chef-2633786937',3,'Team-oriented encompassing capacity');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('q2p6b3z4e0h4',5652806794,'chef-0306640423',1,'Multi-channelled clear-thinking approach');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('b2v5x0t9z4l0',6035314078,'chef-1796940861',4,'Team-oriented fresh-thinking definition');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('b3y0o0v6e6c1',0530379684,'chef-7053122169',3,'Extended eco-centric productivity');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('m8o1n0a9s1b8',6666408381,'chef-9823785908',5,'Persevering reciprocal matrices');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('a9g7y5n6p6i3',1787437179,'chef-5039725977',5,'Optional homogeneous focus group');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('r7d2d7s8g2k9',3943310720,'chef-4471120964',3,'Front-line fresh-thinking matrices');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('g2e8l5m3z8t5',8686381072,'chef-3096234415',5,'Open-source interactive analyzer');
INSERT INTO ChefReview(chef_review_id,reviewer_id,chef_id,rating,description) VALUES ('m6h5y0r1z3d2',4569140322,'chef-0728410444',4,'Multi-layered responsive ability');

create table DynamoMealsV2.ConsReview (
	consumer_review_id VARCHAR(50) PRIMARY KEY,
	reviewer_id VARCHAR(50) NOT NULL,
	consumer_id VARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	description VARCHAR(50),
	CONSTRAINT fk_13 foreign key (reviewer_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_14 foreign key (consumer_id) REFERENCES Consumers (consumer_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('b7a4g7r1r3d3',8761353670,'consumer-4115839819',2,'Versatile directional orchestration');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('n2f3n9m9u2s1',4876321349,'consumer-6230596171',5,'Visionary bandwidth-monitored hardware');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('b0i0g7o7s8q1',3210177218,'consumer-8765991669',3,'Switchable fresh-thinking framework');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('r0b9d7d7r2r6',6903108375,'consumer-8624772349',2,'Versatile next generation standardization');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('h7i8u8s4j1u8',5652806794,'consumer-2858977612',4,'Devolved uniform local area network');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('m8b1o9x2r1r8',6035314078,'consumer-9311283308',2,'Inverse needs-based concept');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('n8c8d2s5t6s6',0530379684,'consumer-3444503604',5,'Re-engineered 24 hour parallelism');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('w6p4a8j3a9s5',6666408381,'consumer-8603585179',1,'Inverse logistical software');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('d8n6b7f2c2t6',1787437179,'consumer-8055338372',1,'Reduced context-sensitive knowledge base');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('d0s0l2r9o2y1',3943310720,'consumer-7287119693',3,'Multi-lateral eco-centric pricing structure');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('s8g0o9i1q6l9',8686381072,'consumer-0231141671',3,'Re-engineered fresh-thinking adapter');
INSERT INTO ConsReview(consumer_review_id,reviewer_id,consumer_id,rating,description) VALUES ('i0e8o5y2m8z5',4569140322,'consumer-6783275722',4,'Right-sized maximized attitude');

create table DynamoMealsV2.DriverReview (
	driver_review_id VARCHAR(50) PRIMARY KEY,
	reviewer_id VARCHAR(50) NOT NULL,
	driver_id VARCHAR(50) NOT NULL,
	rating INT NOT NULL,
	description VARCHAR(50),
	CONSTRAINT fk_15 foreign key (reviewer_id) REFERENCES Users (user_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_16 foreign key (driver_id) REFERENCES Drivers (driver_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('e0w1b6x8k1t0',8761353670,'driver-7602000741',2,'Stand-alone optimizing utilisation');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('r4y6r3w9j5m9',4876321349,'driver-0044649772',2,'Visionary bifurcated model');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('x6s0z8x6o4c7',3210177218,'driver-1262688841',4,'Organic heuristic info-mediaries');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('r3j6g0o1d6g0',6903108375,'driver-5135519555',4,'Vision-oriented context-sensitive open system');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('h6p2x6v3f3h2',5652806794,'driver-5835394224',4,'Proactive explicit neural-net');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('l8f2h7m6y4w1',6035314078,'driver-5957762684',3,'Persevering system-worthy initiative');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('i4o6s4w6f4z4',0530379684,'driver-0327100641',4,'Profit-focused high-level website');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('u6r4b6n4l1l5',6666408381,'driver-3584323207',3,'Extended eco-centric capacity');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('i4w1d2a1j1g4',1787437179,'driver-4113262432',5,'Reduced directional migration');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('d2w4x3m6g8l8',3943310720,'driver-2833491848',1,'Synergized well-modulated definition');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('l5f3s5j2f7p7',8686381072,'driver-3703669094',1,'Synergistic grid-enabled superstructure');
INSERT INTO DriverReview(driver_review_id,reviewer_id,driver_id,rating,description) VALUES ('v3p7b9l4g1r3',4569140322,'driver-4546280011',2,'Realigned empowering attitude');

create table DynamoMealsV2.Deliveries (
	delivery_id VARCHAR(50) PRIMARY KEY,
	order_id VARCHAR(50) NOT NULL,
	driver_id VARCHAR(50) NOT NULL,
	expected_pickup VARCHAR(50),
	expected_delivery VARCHAR(50),
	pickup_address VARCHAR(50) NOT NULL,
	delivery_address VARCHAR(50) NOT NULL,
	CONSTRAINT fk_17 foreign key (order_id) REFERENCES Orders (order_id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_18 foreign key (driver_id) REFERENCES Drivers (driver_id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('8EthhGm8WX','l1f8q3m2y0h3','driver-7602000741','9:09 PM','11:26 AM','69878 Pennsylvania Alley','93 Victoria Plaza');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('jaTdijq9Gc','t5v3s3v1v0n3','driver-0044649772','2:51 PM','6:30 PM','29354 Macpherson Pass','090 Morningstar Pass');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('NLbtnmenV1','t8x1x9n6a2v4','driver-1262688841','12:10 AM','9:34 AM','49 Homewood Road','5991 Pankratz Point');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('zEcTtGpJoK','i0m5q4l9x9e1','driver-5135519555','1:22 PM','12:56 PM','050 Quincy Pass','21276 Twin Pines Drive');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('lbT0vLjH1O','e2e8k2a3a3d5','driver-5835394224','4:20 AM','3:36 PM','6195 Shopko Center','71 Manley Parkway');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('tELSdYmc1H','w9a6o9r2j0z4','driver-5957762684','3:09 PM','2:34 PM','25968 Bashford Place','2067 Menomonie Way');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('rwT4aCN2Ro','m7n8v1a5m2h7','driver-0327100641','3:25 PM','2:51 AM','08 American Ash Trail','98750 Acker Road');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('xsW3yLvXWj','v2v0w9p4m2c3','driver-3584323207','3:58 AM','9:50 PM','0895 Hooker Alley','009 Ryan Avenue');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('0j5i44tK5G','u8p7g7z8k8g0','driver-4113262432','6:56 AM','4:08 PM','513 Calypso Way','3818 Westerfield Point');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('XTE7MKxeAl','a8g5g5q5j2k4','driver-2833491848','6:07 AM','11:31 AM','65 Arrowood Plaza','83 Fremont Street');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('2Wx2BrOf6k','y6z3d0p5e0s3','driver-3703669094','3:15 PM','4:04 PM','6 Burning Wood Place','44855 Farmco Alley');
INSERT INTO Deliveries(delivery_id,order_id,driver_id,expected_pickup,expected_delivery,pickup_address,delivery_address) VALUES ('CoX516DeFs','j5g4t0a8x9n8','driver-4546280011','1:19 AM','9:47 PM','17526 Boyd Court','48342 Comanche Junction');
