DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL
)

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    fav_region_id INTEGER REFERENCES regions ON DELETE SET NULL
)

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT UNIQUE NOT NULL
)

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories ON DELETE SET 1,
    title VARCHAR(100) NOT NULL,
    post_text TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    post_location TEXT,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL
)

INSERT INTO categories (category_name)
VALUES ('miscellaneous');