CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital TO arunova_203;

\connect hospital

CREATE TABLE station (
  stat_nr int PRIMARY KEY,
  name varchar
);

CREATE TABLE station_personnel (
  pers_nr int PRIMARY KEY,
  name int,
  station_num int NOT NULL
);

CREATE TABLE caregiver (
  pers_nr int PRIMARY KEY,
  qualification varchar
);

CREATE TABLE doctor (
  pers_nr int PRIMARY KEY,
  area varchar,
  rank varchar
);

CREATE TABLE patient (
  patient_nr int PRIMARY KEY,
  name varchar,
  disease varchar,
  doctor_nr int
);

CREATE TABLE room (
  room_nr int PRIMARY KEY,
  beds int,
  station_nr int NOT NULL
);

CREATE TABLE admission (
  id int PRIMARY KEY,
  patient_nr int,
  room_nr int,
  "from" timestamp,
  "to" timestamp
);

ALTER TABLE station_personnel ADD FOREIGN KEY (station_num) REFERENCES station (stat_nr);
ALTER TABLE patient ADD FOREIGN KEY (doctor_nr) REFERENCES doctor (pers_nr);
ALTER TABLE room ADD FOREIGN KEY (station_nr) REFERENCES station (stat_nr);
ALTER TABLE admission ADD FOREIGN KEY (patient_nr) REFERENCES patient (patient_nr);
ALTER TABLE admission ADD FOREIGN KEY (room_nr) REFERENCES room (room_nr);