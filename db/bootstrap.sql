create database shower_thoughts;

grant all privileges on shower_thoughts.* to 'webapp'@'%';
flush privileges;

use shower_thoughts;

create table MonetizationLevel (
    MonetizationID int primary key auto_increment,
    Title varchar(200) not null,
    EarningRate decimal(5, 2) not null
);

create table User (
    UserID int primary key auto_increment,
    Username varchar(100) not null unique,
    Phone varchar(20) not null unique,
    FirstName varchar(50),
    LastName varchar(50),
    CreationDate datetime not null default now(),
    MonetizationID int not null,
    foreign key (MonetizationID) references MonetizationLevel(MonetizationID) on delete restrict on update cascade
);

create table AdvertiserContact (
    ContactID int primary key auto_increment,
    Email varchar(100) not null unique,
    FirstName varchar(50) not null,
    LastName varchar(50) not null
);

create table Advertiser (
    AdvertiserID int primary key auto_increment,
    Name varchar(200) not null,
    CreationDate datetime not null default now(),
    ContactID int,
    foreign key (ContactID) references AdvertiserContact(ContactID) on delete cascade on update cascade
);

create table Thought (
    ThoughtID int primary key auto_increment,
    Content varchar(500),
    PostTime datetime not null default now(),
    UserID int,
    foreign key (UserID) references User(UserID) on delete set null on update cascade
);

create table AdCampaign (
    CampaignID int auto_increment,
    AdvertiserID int not null,
    Title varchar(100) not null,
    Cost decimal(10, 2) not null,
    CreationDate datetime not null default now(),
    StartDate datetime not null,
    EndDate datetime not null,
    primary key (AdvertiserID, CampaignID),
    key (CampaignID),
    foreign key (AdvertiserID) references Advertiser(AdvertiserID) on delete cascade on update cascade
);

create table Advertisement (
    AdID int auto_increment,
    CampaignID int not null,
    Title varchar(100) not null,
    Content varchar(1000) not null,
    CreationDate datetime not null default now(),
    primary key (CampaignID, AdID),
    key (AdID),
    foreign key (CampaignID) references AdCampaign(CampaignID) on delete cascade on update cascade
);

create table UserFollows (
    FollowerID int not null,
    FollowingID int not null,
    FollowTime datetime not null default now(),
    primary key (FollowerID, FollowingID),
    foreign key (FollowerID) references User(UserID) on delete cascade on update cascade,
    foreign key (FollowingID) references User(UserID) on delete cascade on update cascade
);

create table ThoughtLikes (
    UserID int not null,
    ThoughtID int not null,
    LikeTime datetime not null default now(),
    foreign key (UserID) references User(UserID) on delete cascade on update cascade,
    foreign key (ThoughtID) references Thought(ThoughtID) on delete cascade on update cascade
);

create table ThoughtComments (
    CommentID int primary key auto_increment,
    UserID int not null,
    ThoughtID int not null,
    CommentTime datetime not null default now(),
    Content varchar(200),
    foreign key (UserID) references User(UserID) on delete cascade on update cascade,
    foreign key (ThoughtID) references Thought(ThoughtID) on delete cascade on update cascade
);

create table AdViews (
    UserID int not null,
    AdID int not null,
    foreign key (UserID) references User(UserID) on delete cascade on update cascade,
    foreign key (AdID) references Advertisement(AdID) on delete cascade on update cascade
);

create table AdClicks (
    UserID int not null,
    AdID int not null,
    foreign key (UserID) references User(UserID) on delete cascade on update cascade,
    foreign key (AdID) references Advertisement(AdID) on delete cascade on update cascade
);

insert into MonetizationLevel
    (Title, EarningRate)
values
    ('Thinker', 0),
    ('Philosopher', 0.35)
;

insert into User
    (Username, Phone, FirstName, MonetizationID)
values
   ('onthejohn', '659-122-0016', 'John', (select MonetizationID from MonetizationLevel where Title = 'Thinker')),
   ('jessiethoughts', '999-123-4579', 'Jessie', (select MonetizationID from MonetizationLevel where Title = 'Philosopher'))
;

insert into AdvertiserContact
    (Email, FirstName, LastName)
values
    ('byates@bidetcorp.com', 'Barry', 'Yates'),
    ('byates@sinkfixers.com', 'Barry', 'Yates')
;

insert into Advertiser
    (Name, ContactID)
values
    ('Bidet Corp.', (select ContactID from AdvertiserContact where email = 'byates@bidetcorp.com')),
    ('Sink Fixers Inc.', (select ContactID from AdvertiserContact where email = 'byates@sinkfixters.com'))
;

insert into Thought
    (Content, UserID)
values
    ('Are bananas just vegan slugs?', (select UserID from User where Username = 'onthejohn')),
    ('Like this if you want to support my shower thoughts career!', (select UserID from User where Username = 'jessiethoughts')),
    ('This\'ll definitely get my account deleted', null)
;

insert into AdCampaign
    (AdvertiserID, Title, Cost, StartDate, EndDate)
values
    ((select AdvertiserID from Advertiser where Name = 'Bidet Corp.'), 'Big Bidet Sale', 789.99, '2023-05-01 00:00:00', '2023-06-01 00:00:00'),
    ((select AdvertiserID from Advertiser where Name = 'Sink Fixers Inc.'), 'BOGO Sink Repairs', 567.77, '2023-05-01 00:00:00', '2023-06-01 00:00:00')
;

insert into Advertisement
    (CampaignID, Title, Content)
values
    ((select CampaignID from AdCampaign where Title = 'Big Bidet Sale'), '5/12/23 Sale', 'Visit Bidet Corp. on May 12, 2023 for a big sale!'),
    ((select CampaignID from AdCampaign where Title = 'BOGO Sink Repairs'), 'BOGO with a Friend', 'Refer a friend for sink repairs and get an extra BOGO deal!')
;

insert into UserFollows
    (FollowerID, FollowingID)
values
    ((select UserID from User where Username = 'onthejohn'), (select UserID from User where Username = 'jessiethoughts'))
;

insert into ThoughtLikes
    (UserID, ThoughtID)
values
    ((select UserID from User where Username = 'jessiethoughts'), (select ThoughtID from Thought where Content = 'Are bananas just vegan slugs?')),
    ((select UserID from User where Username = 'onthejohn'), (select ThoughtID from Thought where Content = 'This\'ll definitely get my account deleted'))
;

insert into ThoughtComments
    (UserID, ThoughtID, Content)
values
    ((select UserID from User where Username = 'onthejohn'), (select ThoughtID from Thought where Content = 'Are bananas just vegan slugs?'), 'Wowza! What a banger!'),
    ((select UserID from User where Username = 'onthejohn'), (select ThoughtID from Thought where Content = 'Are bananas just vegan slugs?'), 'I gotta save this one!')
;

insert into AdViews
    (UserID, AdID)
values
    ((select UserID from User where Username = 'onthejohn'), (select AdID from Advertisement where Title = 'BOGO with a Friend')),
    ((select UserID from User where Username = 'onthejohn'), (select AdID from Advertisement where Title = 'BOGO with a Friend')),
    ((select UserID from User where Username = 'onthejohn'), (select AdID from Advertisement where Title = 'BOGO with a Friend'))
;

insert into AdClicks
    (UserID, AdID)
values
    ((select UserID from User where Username = 'onthejohn'), (select AdID from Advertisement where Title = 'BOGO with a Friend')),
    ((select UserID from User where Username = 'onthejohn'), (select AdID from Advertisement where Title = 'BOGO with a Friend'))
;