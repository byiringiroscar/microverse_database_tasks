/* Database schema to keep the structure of entire database. */

/* Create the database */
CREATE DATABASE vet_clinic;

/* Switch to the vet_clinic database */
USE vet_clinic;

/* Create the animals table */

create table animals(
	id INTEGER PRIMARY KEY AUTOINCREMENT ,
	name varchar(255),
	date_of_birth DATE,
	escape_attempts INTEGER,
	neutered BOOLEAN,
	weight_kg DECIMAL(10,2)
	
);
