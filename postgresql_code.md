psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE Universe;

CREATE TABLE galaxy(
                    galaxy_id SERIAL UNIQUE, 
                    name VARCHAR NOT NULL, 
                    constellation TEXT, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    distance_earth_Mly FLOAT,
                    size_ly INT,
                    Tech_id INT, 
                    CONSTRAINT PK_galaxy PRIMARY KEY (galaxy_id)
                    );
  

INSERT INTO galaxy(name, constellation, type, year_disc, distance_earth_Mly, size_ly) 
  VALUES(
    'Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850),
    ('Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000),
    ('Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500),
    ('Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800),
    ('Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000
          );
    
    
 CREATE TABLE star(
                    star_id SERIAL UNIQUE, 
                    Galaxy_id INT,
                    name VARCHAR NOT NULL, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    have_planets BOOLEAN,
                    n_planets INT,
                    Tech_id INT, 
                    CONSTRAINT PK_star PRIMARY KEY (star_id)
                    );
                    
INSER INTO star(Galaxy_id, name, type, year_disc, have_planets, n_planets)
  VALUES(1, 
    'Sun', 'spectral (G2V), 450, TRUE, 8),
    (1, 'Kepler-1649', 'red dwarf (M5V)', 2020, TRUE, 2),
    (5, 'Gliese 163', 'm-type (M3V)', 2012, TRUE, 5)
    (2, 'Alpha_andromedae', 'early-type A (A3V)', 1993, FALSE, 0),
    (2, 'Mirach', 'red giant (M0III)', 1521, FALSE, 0),
    
    
   
  CREATE TABLE planet(
                    planet_id SERIAL UNIQUE, 
                    star_id INT,
                    name VARCHAR NOT NULL, 
                    size_km FLOAT, 
                    year_disc NUMERIC,
                    have_moons BOOLEAN,
                    n_moons INT,
                    Tech_id INT, 
                    CONSTRAINT PK_star PRIMARY KEY (star_id)
                    );

INSER INTO planet(star_id, name, size_km, year_disc, have_moons, n_moons)
  VALUES(
    1,'Earth', 12742, NULL, TRUE, 1),
    (1, 'Mars', 6778, 1610, TRUE, 2),
    (1, 'Mercury', 4871.4, 1631, FALSE, 0),
    (1, 'Venus', 12104, 1610, FALSE, 0),
    (1, 'Jupiter', 139820, 1610, TRUE, 80),
    (1, 'Neptune', 49244, 1846, TRUE, 14),
    (2, 'Kepler-1649c', 6753.3, 2020, NULL, NULL),
    (3, 'Gliese 163 c', 28000, 2012, NULL, NULL),
    
    
    
  
               

 CREATE TABLE moom(
                    star_id SERIAL UNIQUE, 
                    Galaxy_id INT,
                    name VARCHAR NOT NULL, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    have_planets BOOLEAN,
                    n_planets INT,
                    Tech_id INT, 
                    CONSTRAINT PK_star PRIMARY KEY (star_id)
                    );
    
  
  
  
  
    
