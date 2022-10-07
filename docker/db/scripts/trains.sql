CREATE DATABASE trains;
GRANT ALL PRIVILEGES ON DATABASE trains TO arunova_203;

\connect trains

CREATE TABLE train (
  train_nr int PRIMARY KEY,
  length int,
  start_station_name varchar,
  end_station_name varchar
);

CREATE TABLE city (
  region varchar,
  name varchar,
  PRIMARY KEY (region, name)
);

CREATE TABLE station (
  name varchar PRIMARY KEY,
  tracks int,
  region varchar NOT NULL,
  city_name varchar NOT NULL
);

CREATE TABLE connection (
  id int PRIMARY KEY,
  train_nr int NOT NULL,
  from_station varchar,
  to_station varchar,
  arrival timestamp,
  departure timestamp
);

ALTER TABLE station ADD FOREIGN KEY (city_name, region) REFERENCES city (name, region);
ALTER TABLE train ADD FOREIGN KEY (start_station_name) REFERENCES station (name);
ALTER TABLE train ADD FOREIGN KEY (end_station_name) REFERENCES station (name);
ALTER TABLE connection ADD FOREIGN KEY (train_nr) REFERENCES train (train_nr);
ALTER TABLE connection ADD FOREIGN KEY (from_station) REFERENCES station (name);
ALTER TABLE connection ADD FOREIGN KEY (to_station) REFERENCES station (name);
