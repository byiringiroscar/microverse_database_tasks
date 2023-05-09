/*Queries that provide answers to the questions from all projects.*/

select * from animals;
select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' AND '2019-12-31';
select name from animals where neutered=true and escape_attempts<3;
select date_of_birth from animals where name='Agumon' or name='Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered=true;
SELECT * from animals WHERE name <> 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
select * from animals;
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
select * from animals

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals where escape_attempts = 0;
SELECT AVG(weight_kg) from animals;
SELECT neutered, SUM(escape_attempts) as total_attempts 
FROM animals
GROUP BY neutered
SELECT species, MIN(weight_kg) AS min_weight , MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

