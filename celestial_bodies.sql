psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE Universe;

CREATE TABLE obs_technology(
                    tech_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR UNIQUE NOT NULL, 
                    dev_year NUMERIC, 
                    country TEXT,
                    developer VARCHAR 
                    );
  
INSERT INTO obs_technology(name, dev_year, country, developer) 
  VALUES (
     'optical', 1608,'Germany-Dutch', 'Hans Lippershey'),
     ('occultation', 1590, 'Germany', 'Michael Maestlin'),
     ('X-ray astronomy', 1927, 'USA', 'US_Naval_Research_Laboratory'), 
     ('infrared', 1830, 'Scotland', 'Charles Piazzi Smyth'),
     ('radio_astronomy', 1933, 'USA','Karl_Jansky');


CREATE TABLE galaxies(
                    galaxy_id SERIAL UNIQUE PRIMARY KEY, 
                    name VARCHAR UNIQUE NOT NULL, 
                    constellation TEXT, 
                    type VARCHAR, 
                    year_disc NUMERIC,
                    distance_earth_Mly FLOAT,
                    size_ly INT,
                    tech_id INT,
                    CONSTRAINT FK_tech_galaxy FOREIGN KEY (tech_id) REFERENCES obs_technology(tech_id)
                    );
  

INSERT INTO galaxies(name, constellation, type, year_disc, distance_earth_Mly, size_ly, tech_id) 
  VALUES(
    'Milky_way', 'Sagittaurus', 'barred_spiral', 1610, 0.026, 52850, 1),
    ('Andromeda', 'Andromeda', 'barred_spiral', 964, 2537, 110000, 1),
    ('Centaurus_A', 'Centaurus', 'elliptical', 1826, 13.5, 48500, 5),
    ('Canis_Major_dwarf', 'Canis_Major', 'irregular', 2003, 0.025, 16800, 5),
    ('Large_Magellanic_cloud', 'Dorado', 'barred_dwarf_spiral', 1913, 0.163, 7000, 4),
    ('Sombrero', 'Virgo', 'elliptical', NULL, 0.490, 25000 ,5
          );
    
    
CREATE TABLE stars(
                    star_id SERIAL UNIQUE PRIMARY KEY, 
                    galaxy_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    spectral_type VARCHAR, 
                    year_disc NUMERIC,
                    have_planets BOOLEAN,
                    n_planets INT,
                    tech_id INT, 
                    CONSTRAINT FK_tech_star FOREIGN KEY (tech_id) REFERENCES obs_technology(tech_id),
                    CONSTRAINT FK_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES galaxies(galaxy_id)
                    );
                    
INSERT INTO stars(Galaxy_id, name, spectral_type, year_disc, have_planets, n_planets, tech_id)
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
    (1, 'KOI-268', NULL, 2013, TRUE, 1, 3),
    (2, 'Vega', 'A0Va', 2005, FALSE, 0, 4
        );
    
   
CREATE TABLE planets(
                    planet_id SERIAL UNIQUE PRIMARY KEY, 
                    star_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    radius_size_km FLOAT, 
                    year_disc NUMERIC,
                    have_moons BOOLEAN,
                    n_moons INT,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_planet FOREIGN KEY (tech_id) REFERENCES obs_technology(tech_id),
                    CONSTRAINT FK_star_planet FOREIGN KEY (star_id) REFERENCES stars(star_id)
                    );

INSERT INTO planets(star_id, name, radius_size_km, year_disc, have_moons, n_moons, tech_id)
  VALUES(
    1,'Earth', 12742, NULL, TRUE, 1, 2),
    (1, 'Mars', 6778, 1610, TRUE, 2, 1),
    (1, 'Mercury', 4871.4, 1631, FALSE, 0, 1),
    (1, 'Venus', 12104, 1610, FALSE, 0, 1),
    (1, 'Jupiter', 139820, 1610, TRUE, 80, 1),
    (1, 'Neptune', 49244, 1846, TRUE, 14, 1),
    (1, 'Saturn', 58232, 1610, TRUE, 83, 1),
    (1, 'Pluto', 1188.3, 1930, TRUE, 4, 1),
    (1, 'Uranus', 25362, 1781, TRUE, 27, 1),
    (2, 'Kepler-1649c', 6753.3, 2020, NULL, NULL, 3),
    (3, 'Gliese-163c', 28000, 2012, NULL, NULL, 2),
    (6, '51_Pegasi_b', 135830 ,1995, FALSE, 0, 2),
    (9, 'L 98-59-f', 3140, 2021, NULL, NULL, 2),
    (12, 'Bocaprins',167820, 2011, NULL, NULL, 4),
    (13, 'KOI-268.01', 112000, 2013, TRUE, 1, 3
        );

CREATE TABLE moons(
                    moon_id SERIAL UNIQUE PRIMARY KEY, 
                    planet_id INT,
                    name VARCHAR UNIQUE NOT NULL, 
                    radius_size_km FLOAT, 
                    year_disc NUMERIC,
                    Tech_id INT, 
                    CONSTRAINT FK_tech_moom FOREIGN KEY (tech_id) REFERENCES obs_technology(tech_id),
                    CONSTRAINT FK_planet_moom FOREIGN KEY (planet_id) REFERENCES planets(planet_id)
                    );
    
INSERT INTO moons(planet_id, name, radius_size_km, year_disc, tech_id)
  VALUES(
    1, 'Moon', 3474, 428, 1),
    (2, 'Phobos', 22.2, 1877, 2),
    (2, 'Deimos', 6.2, 1877, 4),
    (5, 'Io', 1821.6, 1610, 2),
    (5, 'Europa', 1560.8, 1610, 2),
    (5, 'Ganymede', 2631, 1610, 1),
    (5, 'Callisto', 2410.3, 1610, 1),
    (5, 'Amalthea', 83.5, 1979, 2),
    (5, 'Metis', 43, 1979, 2),
    (5, 'Adrasthea', 16.4, 1979, 2),
    (5, 'Thebe', 98.6, 1979, 1),
    (5, 'Leda', 21.5, 1974, 2),
    (6, 'Triton', 1353.4, 1846, 1),
    (6, 'Nereid', 170, 1949, 2),
    (6, 'Galatea', 87.4, 1989, 1),
    (6, 'Despina', 75, 1989, 2),
    (6, 'Proteus', 210, 1989, 2),
    (6, 'Thalassa', 41, 1989, 2),
    (6, 'Halimede', 31, 2002, 2),
    (7, 'Titan', 2474.3, 1965, 1), 
    (7, 'Enceladus', 500, 1789, 1), 
    (7, 'Mimas', 198.2, 1789, 2), 
    (7, 'Atlas', 15, 1980, 1), 
    (7, 'Lapetus', 734.5, 1671, 2), 
    (5, 'Elara', 80, 1905, 1), 
    (5, 'Himalia', 149, 1904, 1), 
    (5, 'Callirrhoe', 1.3, 2000, 1), 
    (5, 'Carpo', 3, 2003, 1), 
    (8, 'Charon', 606, 1978, 1), 
    (5, 'Eukelade', 4, 2033, 3),
    (7, 'Hyperion', 135, 1848, 1), 
    (7, 'Iapetus', 734.5, 1671, 1),
    (9, 'Miranda', 500, 1986, 1), 
    (15, 'KOI-268.01_moon', NULL, 2013, 3)
      ;
