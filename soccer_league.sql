DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c craigslist

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    city TEXT NOT NULL
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    birthday DATE,
    height INTEGER,
    current_team_id INTEGER REFERENCES teams ON DELETE SET NULL
)

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN DEFAULT false
)

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location TEXT,
    date DATE,
    start_time DATETIME,
    season_id INTEGER REFERENCES seasons,
    head_referee_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistant_referee_1_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistant_referee_2_id INTEGER REFERENCES referees ON DELETE SET NULL
)

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
)

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
)

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    result TEXT DEFAULT draw
)