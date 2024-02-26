-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_nmae TEXT
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT UNIQUE NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT UNIQUE NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
  from_city_id INTEGER REFERENCES cities,
  to_city_id INTEGER REFERENCES cities,
  from_country_id INTEGER REFERENCES countries,
  to_country_id INTEGER REFERENCES countries
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  flight_id INTEGER REFERENCES flights ON DELETE CASCADE,
  seat TEXT NOT NULL
);

