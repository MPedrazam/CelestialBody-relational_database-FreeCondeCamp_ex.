psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE Universe;

CREATE TABLE Galaxy(
                    Galaxy_id SERIAL UNIQUE, 
                    name VARCHAR NOT NULL, 
                    constellation TEXT, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    distance_earth_Mly INT,
                    size_ly INT,
                    Tech_id INT, 
                    CONSTRAINT PK_Galaxy PRIMARY KEY (Galaxy_id)
                    );
  

INSERT INTO galaxy(name, constellation, type, year_disc, distance_earth_Mly, size_ly) 
  VALUES
    ('Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850),
    ('Andromeda', 'Andromeda', 'barred_spiral', 964, 2.537, 110000),
    ('Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500),
    ('Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800),
    ('Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000);
    
    
