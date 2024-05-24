create database music_streaming_service;
use music_streaming_service;
create table Artist
(ArtistID int primary key,
Name varchar(50),
Dob date,
Gender varchar(50)
);

create table Album
(AlbumID int primary key,
Title varchar(50),
NbOfTracks int,
ReleaseYear int, 
Duration int
);

create table Song
(SongID int auto_increment primary key,
Title varchar(50),
ReleaseYear int,
Duration int
);

create table Genre
(GenreID int auto_increment primary key,
Type varchar(50),
Description varchar(256)
);

create table RecordLabel
(RecordLabelID int auto_increment primary key,
Founder varchar(50),
Name varchar(50),
Description varchar(256)
);

create table Playlist
(PlaylistID int auto_increment primary key,
Name varchar(50),
NbOfSongs int,
Duration int
);


create table User
(UserID int auto_increment primary key,
Username varchar(50),
Email varchar(50),
Password varchar(50),
DoB date
);

create table Subscription (
    SubscriptionID int auto_increment primary key,
    PlanName varchar(50),
    Price decimal(10,2)
);

create table Writer(
	WriterID int auto_increment primary key,
    Name varchar(50),
    Biography varchar(256)
    );
create table UserSongLikes 
(UserID int,
SongID int,
primary key (UserID, SongID),
foreign key (UserID) references User(UserID),
foreign key (SongID) references Song(SongID)
);

create table UserArtistFollows 
(UserID int,
ArtistID int,
primary key (UserID, ArtistID),
foreign key (UserID) references User(UserID),
foreign key (ArtistID) references Artist(ArtistID)
);

create table WriterSong 
(WriterID int,
SongID int,
primary key (WriterID, SongID),
foreign key (WriterID) references Writer(WriterID),
foreign key (SongID) references Song(SongID)
);

create table AddedTo 
(PlaylistID int,
SongID int,
primary key (PlaylistID, SongID),
foreign key (PlaylistID) references Playlist(PlaylistID),
foreign key (SongID) references Song(SongID)
);

alter table Playlist add column UserID int,
add constraint CreatedBy foreign key (UserID) references User(UserID);

alter table User add column SubscriptionID int,
add constraint Subscribed foreign key (SubscriptionID) references Subscription(SubscriptionID);

alter table Song add column ArtistID int,
add constraint Singer foreign key (ArtistID) references Artist(ArtistID);

alter table Album add column RecordLabelID int,
add constraint ReleasedBy foreign key (RecordLabelID) references RecordLabel(RecordLabelID);

alter table Artist add column RecordLabelID int,
add constraint DealsWith foreign key (RecordLabelID) references RecordLabel(RecordLabelID);

alter table Song add column AlbumID int,
add constraint Album foreign key (AlbumID) references Album(AlbumID);

alter table Song add column GenreID int,
add constraint Genre foreign key (GenreID) references Genre(GenreID);

alter table Album add column GenreID int,
    add constraint FK_Album_Genre foreign key (GenreID) references Genre(GenreID);

alter table Album add column ArtistID int,
add constraint Artist foreign key (ArtistID) references Artist(ArtistID);

insert into RecordLabel (Founder, Name, Description) values
    ('Scott Borchetta', 'Big Machine Records', 'An independent American record label specializing in country and pop music.'),
    ('Lana Del Rey', 'Polydor Records', 'A British record label owned by Universal Music Group.'),
    ('Harry Styles', 'Columbia Records', 'An American record label owned by Sony Music Entertainment.'),
    ('Ariana Grande', 'Republic Records', 'An American record label owned by Universal Music Group.'),
    ('Ed Sheeran', 'Asylum Records', 'A British record label owned by Warner Music Group.'),
    ('Billie Eilish', 'Darkroom/Interscope Records', 'An American record label owned by Universal Music Group.'),
    ('Beyoncé', 'Parkwood Entertainment', 'An American management and entertainment company founded by Beyoncé in 2008.'),
    ('Drake', 'OVO Sound', 'A Canadian record label founded by rapper Drake, Oliver El-Khatib, and Noah "40" Shebib in 2012.'),
    ('Rihanna', 'Westbury Road Entertainment', 'A Barbadian entertainment company founded by Rihanna.'),
    ('Justin Bieber', 'Def Jam Recordings', 'An American record label owned by Universal Music Group.');
    
insert into Artist (ArtistID, Name, Dob, Gender, RecordLabelID) values
    (1, 'Taylor Swift', '1989-12-13', 'Female', 1),
    (2, 'Lana Del Rey', '1985-06-21', 'Female', 2),
    (3, 'Harry Styles', '1994-02-01', 'Male', 3),
    (4, 'Ariana Grande', '1993-06-26', 'Female', 4),
    (5, 'Ed Sheeran', '1991-02-17', 'Male', 5),
    (6, 'Billie Eilish', '2001-12-18', 'Female', 6),
    (7, 'Beyoncé', '1981-09-04', 'Female', 7),
    (8, 'Drake', '1986-10-24', 'Male', 8),
    (9, 'Rihanna', '1988-02-20', 'Female', 9),
    (10, 'Justin Bieber', '1994-03-01', 'Male', 10);
    
    insert into Genre (Type, Description) values
    ('Pop', 'Popular music characterized by upbeat rhythms, catchy hooks, and relatable lyrics.'),
    ('Indie', 'Music produced independently from major commercial record labels or their subsidiaries, often characterized by its unconventional sound and artistic integrity.'),
    ('Rock', 'A broad genre of popular music that originated as "rock and roll" in the United States in the late 1940s and early 1950s.'),
    ('Hip Hop', 'A genre of music that originated in African American and Hispanic American communities in the Bronx in the late 1970s.'),
    ('R&B', 'Rhythm and blues, often abbreviated as R&B, is a genre of popular music that originated in African American communities in the 1940s.'),
    ('Electronic', 'Music produced using electronic technology, characterized by a reliance on electronic instruments, digital technology, and sampling.'),
    ('Country', 'A genre of popular music that originated in the Southern United States in the early 1920s.'),
    ('Jazz', 'A genre of music that originated in the African-American communities of New Orleans, United States.'),
    ('Classical', 'A genre of music characterized by its complexity, with orchestras, choirs, and soloists often performing intricate compositions.'),
    ('Reggae', 'A music genre that originated in Jamaica in the late 1960s.');

insert into Writer (Name, Biography) values
('Eleanor Gray', 'Versatile writer known for transporting readers to vivid and captivating worlds.'),
('Alexander Frost', 'Bold and innovative writer challenging the boundaries of genre and convention.'),
('Serena Knight', 'Rising star celebrated for authentic voice and compelling storytelling.'),
('Jonathan Rivers', 'Seasoned storyteller blurring the line between reality and fantasy.'),
('Isabella Cruz', 'Visionary writer blending elements of science fiction, fantasy, and literary fiction.'),
('Lucas Greene', 'Exciting new voice exploring the intersection of humanity and artificial intelligence.'),
('Sophie Bennett', 'Captivating storyteller delving into the complexities of the human psyche.'),
('Daniel Reed', 'Versatile writer spanning epic fantasy to gritty crime fiction.'),
('Emma Harrison', 'Masterful storyteller bringing history to life with richly textured worlds.'),
('Nathan Brooks', 'Bold new voice in literary fiction, daringly experimenting with form and structure.');


insert into Album (AlbumID, Title, NbOfTracks, ReleaseYear, Duration, RecordLabelID, GenreID, ArtistID) values
    (1, 'Lover', 18, 2019, 61, 1, 1, 1),
    (2, 'Born to Die', 12, 2012, 48, 2, 2, 2),
    (3, 'Fine Line', 12, 2019, 46, 3, 3, 3),
    (4, 'Dangerous Woman', 15, 2016, 55, 4, 4, 4),
    (5, '÷ (Divide)', 16, 2017, 59, 5, 5, 5),
    (6, 'Sweetener', 15, 2018, 55, 4, 4, 4),
    (7, 'X', 12, 2014, 50, 5, 5, 5),
    (8, 'When We All Fall Asleep, Where Do We Go?', 14, 2019, 42, 6, 6, 6),
    (9, 'Homecoming: The Live Album', 40, 2019, 109, 7, 7, 7),
    (10, 'Scorpion', 25, 2018, 90, 8, 4, 8);

insert into Song (Title, ReleaseYear, Duration, ArtistID, AlbumID, GenreID) values
    ('Cruel Summer', 2019, 190, 1, 1, 1),
    ('Summertime Sadness', 2012, 265, 2, 2, 2),
    ('Watermelon Sugar', 2019, 174, 3, 3, 1),
    ('Into You', 2016, 244, 4, 4, 4),
    ('Shape of You', 2017, 233, 5, 5, 5),
    ('God Is a Woman', 2018, 197, 4, 6, 4),
    ('Sing', 2014, 231, 5, 7, 5),
    ('Bad Guy', 2019, 194, 6, 8, 6),
    ('Formation', 2016, 240, 7, 9, 7),
    ('In My Feelings', 2018, 217, 8, 10, 4);

insert into Subscription (PlanName, Price) values
    ('Basic', 9.99),
    ('Standard', 14.99),
    ('Premium', 19.99);
    
insert into User (Username, Email, Password, DoB, SubscriptionID) values
    ('johndoe', 'johndoe@example.com', 'password123', '1990-08-15', 1),
    ('janedoe', 'janedoe@example.com', 'doe456', '1993-04-25', 2),
    ('alice_smith', 'alice.smith@example.com', 'alicepassword', '1987-12-10', 1),
    ('bobrossfan', 'bob.ross.fan@example.com', 'happytrees', '1995-06-03',3),
    ('musiclover88', 'musiclover88@example.com', 'ilovemusic', '1988-11-18', 2),
    ('travelbug', 'travel.bug@example.com', 'wanderlust', '1992-09-22', 1),
    ('fitnessfreak', 'fitness.freak@example.com', 'fitandstrong', '1986-03-07', 2),
    ('bookworm', 'bookworm@example.com', 'page-turner', '1998-07-31', 2),
    ('techgeek', 'techgeek@example.com', 'coding123', '1991-05-14', 3),
    ('beachbum', 'beach.bum@example.com', 'sandsunfun', '1984-02-28', 1);

insert into Playlist (Name, NbOfSongs, Duration,UserID) values
    ('Chill Vibes', 08, 4644,1),
    ('Workout Mix', 2, 7867,2),
    ('Road Trip Jams', 3, 5566,3),
    ('Study Session', 6, 456,4),
    ('Throwback Hits', 5, 28484,5),
    ('Party Starter', 9, 7797,6),
    ('Relaxation Station', 8, 569,7),
    ('Sunday Morning', 4, 9568,8),
    ('Late Night Grooves', 10, 7567,9),
    ('Feel Good Favorites', 10, 356,10);
insert into UserSongLikes (UserID, SongID) values
    (1, 1),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 7),
    (3, 8),
    (4, 9),
    (4, 10),
    (5, 2),
    (5, 3);

insert into UserArtistFollows (UserID, ArtistID) values
    (1, 1),
    (1, 3),
    (2, 2),
    (2, 4),
    (3, 5),
    (3, 7),
    (4, 6),
    (4, 8),
    (5, 1),
    (5, 10);

insert into WriterSong (WriterID, SongID) values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

insert into AddedTo (PlaylistID, SongID) values
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (5, 10);
    
-- insert a user in the table user
insert into user (Username, Email, Password, DoB, SubscriptionID) values('rayanBazzoun', 'rayanbilalbazoun@example.com', 'rafga', '2004-11-18', 1);

-- updating it such as the user with userid=1 likes Songid=2 instead of 3
update usersonglikes
set SongID=3
where UserID=1 and SongID=2;

-- delete a song from table song where SongID=11
delete from song where SongID=11;

-- find the total duration of each playlist
SELECT p.Name, SUM(Song.Duration) AS TotalDuration
FROM Playlist p
JOIN AddedTo a
ON p.PlaylistID = a.PlaylistID
JOIN Song s 
ON a.SongID = s.SongID
GROUP BY p.Name;

-- liked song in descending order
SELECT Song.Title, COUNT(*) AS Likes
FROM Song
JOIN UserSongLikes
ON Song.SongID = UserSongLikes.SongID
GROUP BY Song.Title
ORDER BY Likes DESC;

-- artist with the most songs
SELECT Artist.Name, COUNT(*) AS NumberOfSongs
FROM Artist
JOIN Song 
ON Artist.ArtistID = Song.ArtistID
GROUP BY Artist.Name
ORDER BY NumberOfSongs DESC;

-- average of song duration per genre
SELECT Genre.Type, AVG(Song.Duration) AS AverageDuration
FROM Genre
JOIN Song 
ON Genre.GenreID = Song.GenreID
GROUP BY Genre.Type;

-- find the total number of songs in each album
SELECT Album.Title, COUNT(*) AS NumberOfSongs
FROM Album
JOIN Song 
ON Album.AlbumID = Song.AlbumID
GROUP BY Album.Title;

-- find all users who have a premium subscription
SELECT User.Username
FROM User
JOIN Subscription 
ON User.SubscriptionID = Subscription.SubscriptionID
WHERE Subscription.PlanName = 'Premium';

-- we want to know this user how many songs he likes
select UserID,count(SongID) As numberOfLikes
from UserSongLikes
GROUP BY  UserID;

-- how many likes does each song have
select s.title,count(UserID) As likes
from UserSongLikes l
join Song s
on l.SongID=s.SongID
GROUP BY s.title
order by likes DESC;

-- Display writers and their songs 
SELECT w.Name AS WriterName, s.Title AS SongTitle 
FROM WriterSong ws 
JOIN Song s 
ON ws.SongID = s.SongID 
JOIN Writer w 
ON ws.WriterID = w.WriterID;

-- Show artists and their record lable 
 SELECT ar.Name AS ArtistName, rl.Name AS LabelName 
 FROM Artist ar 
 JOIN RecordLabel rl 
 ON ar.RecordLabelID = rl.RecordLabelID;

-- List songs and their album title 
SELECT s.Title AS SongTitle, a.Title AS AlbumTitle 
FROM Song s 
JOIN Album a 
ON s.AlbumID = a.AlbumID;

-- Show playlists created by users 
SELECT p.Name AS PlaylistName, u.Username 
FROM Playlist p 
JOIN User u 
ON p.UserID = u.UserID;


