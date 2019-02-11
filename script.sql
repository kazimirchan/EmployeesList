CREATE DATABASE empl;
CREATE TABLE employees ("id" serial NOT NULL, "name" text NOT NULL, "boss_id" int, PRIMARY KEY ("id"));

INSERT INTO employees(name) VALUES('иванов и.и.');
INSERT INTO employees(name) VALUES('чернов и.а.');

INSERT INTO employees(name, boss_id) VALUES('чеканов а.в.', 1);
INSERT INTO employees(name, boss_id) VALUES('наумова а.а.', 1);
INSERT INTO employees(name, boss_id) VALUES('сергеев а.и.', 1);
INSERT INTO employees(name, boss_id) VALUES('сергеева а.и.', 1);

INSERT INTO employees(name, boss_id) VALUES('петров л.в.', 4);
INSERT INTO employees(name, boss_id) VALUES('савинов н.н.', 4);
INSERT INTO employees(name, boss_id) VALUES('терешкова л.н.', 4);
INSERT INTO employees(name, boss_id) VALUES('серова а.и.', 4);

INSERT INTO employees(name, boss_id) VALUES('ващенко у.ю.', 9);
INSERT INTO employees(name, boss_id) VALUES('хан соло', 9);
INSERT INTO employees(name, boss_id) VALUES('чубакка', 9);


INSERT INTO employees(name, boss_id) VALUES('петров б.о.', 8);

INSERT INTO employees(name) VALUES('головань а.я.');
INSERT INTO employees(name, boss_id) VALUES('порг', 13);
INSERT INTO employees(name, boss_id) VALUES('порг', 13);
