-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE songs_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers ON DELETE CASCADE
);

