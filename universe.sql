CREATE TABLE galaxy (
    galaxy_id INT NOT NULL,
    name VARCHAR(30) UNIQUE,
    galaxy_types TEXT,
    has_life BOOLEAN,
    distance_from_earth NUMERIC NOT NULL, 

    UNIQUE(galaxy_id),
    PRIMARY KEY(galaxy_id)
);

INSERT INTO galaxy(galaxy_id,name,galaxy_types,has_life,distance_from_earth)
VALUES (1000, 'Milky Way', 'Spiral',true,0),
(1001, 'Andromeda', 'Spiral',false,25000000),(1010, 'Messier 87', 'Elliptical',true,12000000),
(1011, 'Centaurus A', 'Elliptical',false,12000000),(1100, 'Cartwheel Glaxy', 'Lenticular',true,500000000),
(1101, 'Large Magellanic Cloud', 'Irreuglar',true,53000000);

CREATE TABLE star (
    galaxy_id INT,
    star_id INT NOT NULL,
    name VARCHAR(30) UNIQUE,
    star_type TEXT,
    distance_from_earth_light_years INT NOT NULL,

    UNIQUE(star_id),
    PRIMARY KEY(star_id),
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

INSERT INTO star(galaxy_id,star_id,name,star_type,distance_from_earth_light_years)
VALUES (1000,0001,'Sun','Yellow Dwarf',0),
(1000,0002,'Proxima Centauri','Red Dwarf',4),
(1001,0003,'N31-42','Blue Supergiant',10),
(1101,0004,'R136a1','Wolf-Rayet Star',34),
(1010,0005,'M87 Star','Cluster Stars', 52),
(1100,0006,'Roller Blue','Massive Blue Stars',12);

CREATE TABLE planet(
    star_id INT,
    planet_id INT NOT NULL,
    name VARCHAR(30) UNIQUE,
    planet_type TEXT,
    distance_from_earth_light_years INT NOT NULL,

    UNIQUE(planet_id),
    PRIMARY KEY(planet_id),
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

INSERT INTO planet(star_id,planet_id,name,planet_type,distance_from_earth_light_years)
VALUES (0001, 110, 'Earth', 'Terrestrial', 0),
(0002, 111, 'Proxima B', 'Terrrestrial', 4.24),
(0003, 112, 'TRAPPIST-1e', 'Terrestrial', 39.5),
(0004, 113, '51 Pegaso b', 'Hot Jupiter', 50.45),
(0005, 114, 'Kepler-22b', 'Super-Earth', 600),
(0006, 115, 'Kepler-62f', 'Super-Earth', 1200),
(0001, 116, 'Mars', 'Terrestrial', 225),
(0001, 117, 'Jupiter', 'Gas Giant', 778),
(0001, 118, 'Saturn', 'Gas Giant', 1.43),
(0001, 119, 'Uranus', 'Ice Giant', 3.22),
(0001, 120, 'Neptune', 'Ice Giant', 4.5),
(0001, 121, 'Pluto', 'Ice Rock', 5.59);

CREATE TABLE moon (
    planet_id INT,
    moon_id INT NOT NULL,
    name VARCHAR(30) UNIQUE,
    moon_type TEXT,
    distance_from_earth INT NOT NULL,
    still_as_a_moon BOOLEAN,

    UNIQUE(moon_id),
    PRIMARY KEY(moon_id),
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

INSERT INTO moon(planet_id, moon_id, name, moon_type, distance_from_earth, still_as_a_moon)
VALUES (110, 210, 'Earth Moon', 'Natural Satellite', 384400, true),
(117, 211, 'Io', 'Volcanic Moon', 628.3, true),
(117, 212, 'Europa', 'Icy Moon', 628.3, true),
(117, 213, 'Ganymede', 'Icy/Metallic Moon', 628.3,true),
(117,214,'Callisto', 'Icy Moon', 628.3, true),
(118,215,'Titan', 'Thick Atmosphere Moon', 1.2, true),
(118,216,'Enceladus','Icy Moon', 1.2, true),
(118,217, 'Rhea', 'Icy Moon', 1.2,true),
(118, 218, 'Mimas', 'Icy Moon', 1.2, true),
(118, 219, 'Tethys', 'Icy Moon', 1.2, true),
(119, 220, 'Miranda', 'Icy/Geologically Active Moon', 2.6, true),
(119, 221, 'Ariel', 'Icy Moon', 2.6, true),
(119, 222, 'Umbriel', 'Icy Moon', 2.6, true),
(119, 223, 'Titania', 'Icy Moon', 2.6, true),
(119,224, 'Oberon', 'Icy Moon', 2.6, true),
(120, 225, 'Triton', 'Icy Moon', 4.5, true),
(121, 226, 'Charon', 'Dwarf Planet Moon', 5.8, true),
(116, 227, 'Phobos', 'Rocky Moon', 9.4, true),
(116, 228, 'Deimos', 'Rocky Moon', 23.5, true),
(118, 229, 'Enceladus Moon', 'Icy Moon', 1.2, true);

CREATE TABLE black_hole (
    black_hole_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    age INT UNIQUE,

    UNIQUE(black_hole_id),
    PRIMARY KEY (black_hole_id)
);

INSERT INTO black_hole(black_hole_id,name,age)
VALUES(310, 'Black Hole', 200000),
(311,'White Hole', 5001001),
(312, 'Blue Hole', 6000002);
