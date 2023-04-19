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
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
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
    ContactID int not null,
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
    primary key(UserID, ThoughtID),
    foreign key (UserID) references User(UserID) on delete cascade on update cascade,
    foreign key (ThoughtID) references Thought(ThoughtID) on delete cascade on update cascade
);

create table ThoughtComments (
    CommentID int primary key auto_increment,
    UserID int not null,
    ThoughtID int not null,
    CommentTime datetime not null default now(),
    Content varchar(500),
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
    (MonetizationID, Title, EarningRate)
values
    (1, 'Thinker', 0),
    (2, 'Philosopher', 0.35)
;
