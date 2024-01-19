-- creating database of IMDb
CREATE DATABASE IMDb;

-- to create table and access the database use the IMDb
USE IMDb;

-- Create table for movie with url
CREATE TABLE Movie(
	Movie_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    URL VARCHAR(2500) NOT NULL
);

-- Insert some values into the Movie Table
INSERT INTO Movie ( Title, URL)
VALUES
('Oppenheimer', 'https://www.imdb.com/title/tt15398776/?ref_=ext_shr_lnk'),
('Interstellar', 'https://www.imdb.com/title/tt0816692/?ref_=ext_shr_lnk'),
('The Matrix', 'https://www.imdb.com/title/tt0133093/?ref_=ext_shr_lnk'),
('The Green Mile', 'https://www.imdb.com/title/tt0120689/?ref_=ext_shr_lnk');

-- Create Genre Table
CREATE TABLE Genre (
	Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    Genre_Name VARCHAR(100) NOT NULL
);

-- INSER VALUES OF GENRE
INSERT INTO Genre (Genre_name)
VALUES
	('Biography'),
    ('Drame'),
    ('History'),
    ('Adventure'),
    ('Sci-Fi'),
    ('Action'),
    ('Crime'),
    ('Fantasy');
    
-- Create Table for review 
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    User_Name VARCHAR(255) NOT NULL,
    Movie_ID INT,
    User_comment TEXT,
    Rating FLOAT,
    FOREIGN KEY(Movie_ID) REFERENCES Movie(Movie_ID)
);

-- Insert some values into the table
INSERT INTO Review (Review_ID, User_Name, Movie_ID, User_comment, Rating) 
VALUES
	(1, 'Orlando_Gardner', 1, 'Murphy is exceptional', 8.0),
	(2, 'Bonobo13579', 1, 'Quality but exhausting', 7.0),
	(3, 'kosmasp', 2, 'Out of this world', 10),
	(4, 'Jared_Andrews', 2, 'A visual and auditory marvel', 10),
    (5, 'suryanmukul', 3, 'Benchmark forever.', 10),
    (6, 'xNecRosex', 3, 'The timeless classic.', 10),
    (7, 'undeaddt', 4, 'Rest In Peace, Michael Clarke Duncan, you legend.', 8.0),
    (8, 'TheLittleSongbird', 4, 'Overlong, but haunting, thought-provoking, moving and engrossing', 9.0);

-- Create the Artist_skills table
CREATE TABLE Artist_skill (
    Artist_ID INT PRIMARY KEY,
    Artist_Name VARCHAR(50),
    Skill VARCHAR(100) NOT NULL
);

-- Insert some values into the Artist_skills table
INSERT INTO Artist_skill (Artist_ID, Artist_Name, skill)
VALUES
    (1, 'Cillian Murphy', 'Actor'),
    (2, 'Matthew McConaughey', 'Director'),
    (3, 'Keenu Reeves', 'Producer'),
    (4, 'Tom Hanks', 'Writer');

-- Create the Artist_role table (to handle multiple roles of an artist in a movie)
CREATE TABLE Artist_roles (
    Role_ID INT PRIMARY KEY,
    Artist_ID INT,
    Movie_ID INT,
    Role_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Artist_ID) REFERENCES Artist_skill(Artist_ID),
    FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_ID)
);

-- Insert some values into the Artist_role table
INSERT INTO Artist_roles (Role_ID, Artist_ID, Movie_ID, Role_name)
VALUES
    (1, 1, 1, 'Scientist'),
    (2, 2, 2, 'Farmer'),
    (3, 2, 2, 'Pilot'),
    (4, 3, 3, 'Hacker'),
    (5, 4, 4, 'Lead Guard');
    
-- Create table to have the mulitple Genre
CREATE TABLE Movie_genre(
	Movie_ID INT,
    Genre_ID INT,
    PRIMARY KEY (Movie_ID, Genre_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
    );
    
-- Insert values into Movie genre 
INSERT INTO Movie_genre (Movie_ID, Genre_ID)
VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 2),
    (2, 5),
    (3, 6),
    (3, 5),
    (4, 7),
    (4, 2),
    (4, 8);
    
-- create table for multiple reviews
CREATE TABLE Movie_review (
	Movie_ID INT,
    Review_ID INT,
    PRIMARY KEY (Movie_ID, Review_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    FOREIGN KEY (Review_ID) REFERENCES Review(Review_ID)
    );
    
-- insert the multiple reviews
INSERT INTO Movie_review (Movie_ID, Review_ID)
VALUES
	(1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8);

-- create table for artists having multiple role
CREATE TABLE Artists_Multiple_Roles (
	Movie_ID INT,
    Role_ID INT,
    PRIMARY KEY (Movie_ID, Role_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    FOREIGN KEY (Role_ID) REFERENCES Artist_roles(Role_ID)
);

-- Insert the multiple role
INSERT INTO Artists_Multiple_Roles (Movie_ID, Role_ID)
VALUES
	(1, 1),
    (2, 2),
    (2, 3),
    (3, 4),
    (4, 5);
-- Movie with Multiple Genre    
SELECT Movie.Title, Genre.genre_name
FROM 
	Movie
JOIN 
	Movie_genre
ON 
	Movie.Movie_ID = Movie_genre.Movie_ID
JOIN 
	Genre 
ON 
	Movie_Genre.Genre_ID = Genre.Genre_ID;
-- Movie with mutliple reviews
SELECT Movie.Title, Review.User_comment, Review.Rating
FROM 
	Movie
JOIN 
	Movie_review 
ON 
	Movie.Movie_ID = Movie_review.Movie_ID
JOIN 
	Review 
ON 
	Movie_review.Review_ID = Review.Review_ID;
-- Artist having multiple role
SELECT Movie.Title, Artist_Skill.Artist_name, Artist_roles.Role_name
FROM 
	Movie
JOIN 
	Artists_Multiple_Roles 
ON 
	Movie.Movie_ID = Artists_Multiple_Roles.Movie_ID
JOIN 
	artist_roles 
ON 
	Artists_Multiple_Roles.Role_ID = Artist_roles.Role_ID
JOIN 
	Artist_skill 
ON 
	Artist_roles.Artist_ID = Artist_skill.Artist_ID;




    






    
    
    
    



    
	


















