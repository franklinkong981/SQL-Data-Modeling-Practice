DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    is_active BOOLEAN DEFAULT true
)

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE NOT NULL,
    symptoms TEXT[]
)

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients,
    diseases_id INTEGER REFERENCES diseases
)