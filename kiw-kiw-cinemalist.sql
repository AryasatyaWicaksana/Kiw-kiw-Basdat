CREATE TABLE user_list (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255) DEFAULT 'blank-profile-picture.png' NOT NULL
);

CREATE TABLE movie_list (
	movie_id INT UNIQUE PRIMARY KEY NOT NULL,
    title VARCHAR(200) NOT NULL,
	movie_year INT NOT NULL,
    poster_path TEXT NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    overview TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movie_status(
	id SERIAL PRIMARY KEY,
	id_user INT NOT NULL, FOREIGN KEY(id_user) REFERENCES user_list(id),
	id_movie INT NOT NULL, FOREIGN KEY(id_movie) REFERENCES movie_list(movie_id),
	like_status BOOLEAN NOT NULL DEFAULT FALSE,
	plan_to_watch_status BOOLEAN NOT NULL DEFAULT FALSE,
	completed_status BOOLEAN NOT NULL DEFAULT FALSE
);
