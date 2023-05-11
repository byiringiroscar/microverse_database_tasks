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

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name TEXT,
  age INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  PRIMARY KEY(id)
);

select *from animals
ALTER TABLE animals
DROP COLUMN species;


select *from animals;
ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species_id
  FOREIGN KEY (species_id)
  REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id  INT,
ADD CONSTRAINT fk_owner_id 
  FOREIGN KEY (owner_id )
  REFERENCES owners (id);


CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	age INT,
	date_of_graduation DATE,
	PRIMARY KEY(id)

);

CREATE TABLE specializations (
  id INT GENERATED ALWAYS AS IDENTITY,
  vet_id INT,
  species_id INT,
  PRIMARY KEY (id, vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT,
  vet_id INT,
  visit_date DATE,
  PRIMARY KEY (id, animal_id, vet_id),
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);
