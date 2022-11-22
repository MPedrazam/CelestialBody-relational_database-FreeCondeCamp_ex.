psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE Universe;

CREATE TABLE tech(
                    tech_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR UNIQUE NOT NULL, 
                    dev_year NUMERIC, 
                    country TEXT,
                    developer VARCHAR 
                    );
  
INSERT INTO tech(name, dev_year, country, developer) 
  VALUES (
     'optical', 1608,'Germany-Dutch', 'Hans Lippershey'),
     ('occultation', 1590, 'Germany', 'Michael Maestlin'),
     ('X-ray astronomy', 1927, 'USA', 'US_Naval_Research_Laboratory'), 
     ('infrared', 1830, 'Scotland', 'Charles Piazzi Smyth'),
     ('radio_astronomy', 1933, 'USA','Karl_Jansky');


CREATE TABLE galaxy(
                    galaxy_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR UNIQUE NOT NULL, 
                    constellation TEXT, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    distance_earth_Mly FLOAT,
                    size_ly INT,
                    tech_id INT,
                    CONSTRAINT FK_tech_galaxy FOREIGN KEY (tech_id) REFERENCES tech(tech_id)
                    );
  

INSERT INTO galaxy(name, constellation, type, year_disc, distance_earth_Mly, size_ly, tech_id) 
  VALUES(
    'Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850, 1),
    ('Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000, 1),
    ('Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500, 1),
    ('Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800, 1),
    ('Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000, 1),
    ('Sombrero', 'Virgo', 'elliptical', NULL, 0.490, 25000 ,2
          );
    
    
CREATE TABLE star(
                    star_id SERIAL UNIQUE PRIMARY KEY, 
                    galaxy_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    have_planets BOOLEAN,
                    n_planets INT,
                    tech_id INT, 
                    CONSTRAINT FK_tech_star FOREIGN KEY (tech_id) REFERENCES tech(tech_id),
                    CONSTRAINT FK_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
                    );
                    
INSERT INTO star(Galaxy_id, name, type, year_disc, have_planets, n_planets, tech_id)
  VALUES(1, 
    'Sun', 'G2V', 450, TRUE, 8, 1),
    (1, 'Kepler-1649', 'M5V', 2020, TRUE, 2, 4),
    (5, 'Gliese 163', 'M3V', 2012, TRUE, 5, 3),
    (2, 'Alpha_andromedae', 'A3V', 1993, FALSE, 0, 3),
    (2, 'Mirach', 'M0III', 1521, FALSE, 0, 5),
    (2, '51_pegasi', 'G2IV', 1995, TRUE, 1, 3), 
    (3, 'Delta_Centauri', 'B-type', NULL, FALSE, 0, 3),
    (4, 'Canis_Major', 'DA2', 2000, NULL, NULL, 4),
    (3, 'L 98-59', 'M3V', 2019, TRUE, 4, 3),
    (1, 'Antares', 'B2.5V', 1819, FALSE, 0, 3),
    (1, 'Mu_Cephei', 'M2-Ia', 1881, FALSE, 0, 5),
    (1, 'WASP-39 ', 'G8', 2011, TRUE, 1, 4),
    (1, 'KOI-268', NULL, 2013, TRUE, 1, 3
        );
    
   
CREATE TABLE planet(
                    planet_id SERIAL UNIQUE PRIMARY KEY, 
                    star_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    size_km FLOAT, 
                    year_disc NUMERIC,
                    have_moons BOOLEAN,
                    n_moons INT,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_planet FOREIGN KEY (tech_id) REFERENCES tech(tech_id),
                    CONSTRAINT FK_star_planet FOREIGN KEY (star_id) REFERENCES star(star_id)
                    );

INSERT INTO planet(star_id, name, size_km, year_disc, have_moons, n_moons, tech_id)
  VALUES(
    1,'Earth', 12742, NULL, TRUE, 1, 2),
    (1, 'Mars', 6778, 1610, TRUE, 2, 1),
    (1, 'Mercury', 4871.4, 1631, FALSE, 0, 1),
    (1, 'Venus', 12104, 1610, FALSE, 0, 1),
    (1, 'Jupiter', 139820, 1610, TRUE, 80, 1),
    (1, 'Neptune', 49244, 1846, TRUE, 14, 1),
    (2, 'Kepler-1649c', 6753.3, 2020, NULL, NULL, 3),
    (3, 'Gliese-163c', 28000, 2012, NULL, NULL, 2),
    (6, '51_Pegasi_b', 135830 ,1995, FALSE, 0, 2),
    (9, 'L 98-59-f', 3140, 2021, NULL, NULL, 2),
    (12, 'Bocaprins',167820, 2011, NULL, NULL, 2),
    (13, 'KOI-268.01', 112000, 2013, TRUE, 1, 2
        );

CREATE TABLE moon(
                    moon_id SERIAL UNIQUE PRIMARY KEY, 
                    planet_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    size_km FLOAT, 
                    year_disc NUMERIC,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_moom FOREIGN KEY (tech_id) REFERENCES tech(tech_id),
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
    (17, 'Metis', 43, 1979, 2),
    (17, 'Adrasthea', 16.4, 1979, 2),
    (17, 'Thebe', 98.6, 1979, 1),
    (17, 'Leda', 21.5, 1974, 2),
    (18, 'Triton', 1353.4, 1846, 1),
    (18, 'Nereid', 170, 1949, 2),
    (18, 'Galatea', 87.4, 1989, 1),
    (18, 'Despina', 75, 1989, 2),
    (18, 'Proteus', 210, 1989, 2),
    (18, 'Thalassa', 41, 1989, 2),
    (18, 'Halimede', 31, 2002, 2),
    (24, 'KOI-268.01_moon', NULL, 2013, 3);
