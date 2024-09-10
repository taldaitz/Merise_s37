CREATE DATABASE netflix;

use netflix;

CREATE TABLE movie (
	id int PRIMARY KEY AUTO_INCREMENT,
	title varchar(200) not null,
	country varchar(100) not null,
    release_year int not null,
    description text null,
    duration int null
);

CREATE TABLE movie_director (
	movie_id int not null,
    director_id int not null,
    PRIMARY KEY (movie_id, director_id)
);

CREATE TABLE director (
	id int PRIMARY KEY AUTO_INCREMENT,
	firstname varchar(100),
	lastname varchar(100)
);


CREATE TABLE movie_actor (
	movie_id int not null,
    actor_id int not null,
    PRIMARY KEY (movie_id, actor_id)
);


CREATE TABLE actor (
	id int PRIMARY KEY AUTO_INCREMENT,
	firstname varchar(100),
	lastname varchar(100)
);


CREATE TABLE user (
	id int PRIMARY KEY AUTO_INCREMENT,
	firstname varchar(100),
	lastname varchar(100),
    email varchar(200),
    password varchar(100)
);

CREATE TABLE viewing (
	id int PRIMARY KEY AUTO_INCREMENT,
	date datetime not null,
    user_id int not null,
    movie_id int not null
);


CREATE TABLE subscription (
	id int PRIMARY KEY AUTO_INCREMENT,
    start_date datetime not null,
    end_date datetime null,
    user_id int not null
);

CREATE TABLE favorite (
	user_id int not null,
	movie_id int not null,
    PRIMARY KEY (user_id, movie_id)
);


ALTER TABLE movie_director 
	ADD CONSTRAINT FK_md_movie FOREIGN KEY movie_director(movie_id) REFERENCES movie(id),
	ADD CONSTRAINT FK_md_director FOREIGN KEY movie_director(director_id) REFERENCES director(id);
    
    
ALTER TABLE movie_actor 
	ADD CONSTRAINT FK_ma_movie FOREIGN KEY movie_actor(movie_id) REFERENCES movie(id),
	ADD CONSTRAINT FK_ma_actor FOREIGN KEY movie_actor(actor_id) REFERENCES actor(id);
    
    
ALTER TABLE viewing
	ADD CONSTRAINT FK_viewing_movie FOREIGN KEY viewing(movie_id) REFERENCES movie(id),
	ADD CONSTRAINT FK_viewing_user FOREIGN KEY viewing(user_id) REFERENCES user(id);
    
ALTER TABLE favorite
	ADD CONSTRAINT FK_favorite_movie FOREIGN KEY favorite(movie_id) REFERENCES movie(id),
	ADD CONSTRAINT FK_favorite_user FOREIGN KEY favorite(user_id) REFERENCES user(id);
    
ALTER TABLE subscription
	ADD CONSTRAINT FK_subscription_user FOREIGN KEY subscription(user_id) REFERENCES user(id);
