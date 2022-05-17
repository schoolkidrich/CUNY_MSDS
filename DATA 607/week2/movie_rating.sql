DROP TABLE IF EXISTS movies, friends, ratings;
CREATE TABLE movies (
movieid int NOT NULL AUTO_INCREMENT,
title text NOT NULL,
PRIMARY KEY (movieid)
);
INSERT INTO movies (title)
VALUES 
	('Spider-Man Far From Home'),
	('Avengers: Endgame'),
	('Weathering with you'),
	('Glass'),
	('Captain Marvel');

CREATE TABLE friends (
id int NOT NULL AUTO_INCREMENT,
names text NOT NULL,
PRIMARY KEY (id)
);
INSERT INTO friends(names)
VALUES
	('f1'),
	('f2'),
	('f3'),
	('f4'),
	('f5');

CREATE TABLE ratings (
id int NOT NULL AUTO_INCREMENT,
friend_id int NOT NULL,
movie_id int NOT NULL,
rating int,
PRIMARY KEY(id)
);
INSERT INTO ratings(friend_id, movie_id, rating)
VALUES
	(1, 1, 4),
	(1, 2, 5),
	(1, 3, 5),
	(1, 4, 3),
	(1, 5, 4),
	(2, 1, 4),
	(2, 2, 4),
	(2, 3, 4),
	(2, 4, 4),
	(2, 5, 4),
    (3, 1, NULL),
	(3, 2, 5),
	(3, 3, 5),
	(3, 4, 2),
	(3, 5, 4),
	(4, 1, 5),
	(4, 2, 5),
	(4, 3, 5),
	(4, 4, 5),
	(4, 5, 5),
	(5, 1, 3),
	(5, 2, 3),
	(5, 3, 3),
	(5, 4, 2),
	(5, 5, 4);

SELECT friends.names, movies.title, ratings.rating
FROM ratings
JOIN friends 
ON ratings.friend_id = friends.id
JOIN movies
ON ratings.movie_id = movies.movieid
WHERE ratings.rating IS NOT NULL
ORDER BY friends.names;


    


