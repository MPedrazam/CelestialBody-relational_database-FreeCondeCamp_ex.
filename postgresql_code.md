psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE Universe;

CREATE TABLE obs_tech(
                    tech_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR NOT NULL, 
                    dev_year NUMERIC, 
                    country TEXT,
                    developer VARCHAR 
                    );
  
INSERT INTO obs_tech(name, dev_year, country, developer) 
  VALUES (
     'optical', 1608,'Germany-Dutch', 'Hans Lippershey'),
     ('occultation', 1590, 'Germany', 'Michael Maestlin'),
     ('X-ray astronomy', 1927, 'USA', 'US_Naval_Research_Laboratory'), 
     ('infrared', 1830, 'Scotland', 'Charles Piazzi Smyth'),
     ('radio_astronomy', 1933, 'USA','Karl_Jansky');


CREATE TABLE galaxy(
                    galaxy_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR NOT NULL, 
                    constellation TEXT, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    distance_earth_Mly FLOAT,
                    size_ly INT,
                    Tech_id INT,
                    CONSTRAINT FK_tech_galaxy FOREIGN KEY (tech_id) REFERENCES obs_tech(tech_id)
                    );
  

INSERT INTO galaxy(name, constellation, type, year_disc, distance_earth_Mly, size_ly, tech_id) 
  VALUES(
    'Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850, 1),
    ('Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000, 1),
    ('Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500, 1),
    ('Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800, 1),
    ('Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000, 1
          );
    
    
CREATE TABLE star(
                    star_id SERIAL UNIQUE PRIMARY KEY, 
                    galaxy_id INT,
                    name VARCHAR NOT NULL, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    have_planets BOOLEAN,
                    n_planets INT,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_star FOREIGN KEY (tech_id) REFERENCES obs_tech(tech_id),
                    CONSTRAINT FK_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
                    );
                    
INSERT INTO star(Galaxy_id, name, type, year_disc, have_planets, n_planets, tech_id)
  VALUES(6, 
    'Sun', 'G2V', 450, TRUE, 8, 1),
    (6, 'Kepler-1649', 'M5V', 2020, TRUE, 2, 4),
    (10, 'Gliese 163', 'M3V', 2012, TRUE, 5, 3),
    (7, 'Alpha_andromedae', 'A3V', 1993, FALSE, 0, 3),
    (7, 'Mirach', 'M0III', 1521, FALSE, 0, 5),
    (7, '51_pegasi', 'G2IV', 1995, TRUE, 1, 3), 
    (8, 'Delta_Centauri', 'B-type', NULL, FALSE, 0, 3),
    (9, 'Canis_Major', 'DA2', 2000, NULL, NULL, 4),
    (8, 'L 98-59', 'M3V', 2019, TRUE, 4, 3),
    (6, 'Antares', 'B2.5V', 1819, FALSE, 0, 3),
    (6, 'Mu_Cephei', 'M2-Ia', 1881, FALSE, 0, 5),
    (6, 'WASP-39 ', 'G8', 2011, TRUE, 1, 4),
    (6, 'KOI-268', NULL, 2013, TRUE, 1, 3
        );
    
   
CREATE TABLE planet(
                    planet_id SERIAL UNIQUE PRIMARY KEY, 
                    star_id INT,
                    name VARCHAR NOT NULL, 
                    size_km FLOAT, 
                    year_disc NUMERIC,
                    have_moons BOOLEAN,
                    n_moons INT,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_planet FOREIGN KEY (tech_id) REFERENCES obs_tech(tech_id),
                    CONSTRAINT FK_star_planet FOREIGN KEY (star_id) REFERENCES star(star_id)
                    );

INSERT INTO planet(star_id, name, size_km, year_disc, have_moons, n_moons, tech_id)
  VALUES(
    14,'Earth', 12742, NULL, TRUE, 1, 2),
    (14, 'Mars', 6778, 1610, TRUE, 2, 1),
    (14, 'Mercury', 4871.4, 1631, FALSE, 0, 1),
    (14, 'Venus', 12104, 1610, FALSE, 0, 1),
    (14, 'Jupiter', 139820, 1610, TRUE, 80, 1),
    (14, 'Neptune', 49244, 1846, TRUE, 14, 1),
    (15, 'Kepler-1649c', 6753.3, 2020, NULL, NULL, 3),
    (16, 'Gliese-163c', 28000, 2012, NULL, NULL, 2),
    (18, '51_Pegasi_b', 135830 ,1995, FALSE, 0, 2),
    (22, 'L 98-59-f', 3140, 2021, NULL, NULL, 2),
    (25, 'Bocaprins',167820, 2011, NULL, NULL, 2),
    (16, 'KOI-268.01', 112000, 2013, TRUE, 1, 2
        );

CREATE TABLE moon(
                    moon_id SERIAL UNIQUE PRIMARY KEY, 
                    planet_id INT,
                    name VARCHAR NOT NULL, 
                    size_km FLOAT, 
                    year_disc NUMERIC,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_moom FOREIGN KEY (tech_id) REFERENCES obs_tech(tech_id),
                    CONSTRAINT FK_planet_moom FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
                    );
    
INSERT INTO moon(planet_id, name, size_km, year_disc, tech_id)
  VALUES(
    13, 'Moon', 1731.4, 428, 1),
    (14, 'Phobos', 11267, 1877, 3),
    (14, 'Deimos', 6.2, 1877, 4),
    (17, 'Io', 1821.6, 1610, 2),
    (17, 'Europa', 1560.8, 1610, 2),
    (17, 'Ganymede', 2631, 1610, 1),
    (17, 'Calisto', 2410.3, 1610, 1),
    (17, 'Amalthea', 83.5, 1979, 2),
    (18, 'Triton', 1353.4, 1846, 1),
    (18, 'Nereid', 170, 1949, 2),
    (18, 'Galatea', 87.4, 1989, 1),
    (18, 'Despina', 75, 1989, 2),
    (18, 'Proteus', 210, 1989, 2),
    (18, 'Thalassa', 41, 1989, 2),
    (18, 'Halimede', 31, 2002, 2),
    (24, 'KOI-268.01_moon', NULL, 2013, 3);
