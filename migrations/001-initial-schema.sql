-- Up
-- Create table of users
CREATE TABLE User (
  email TEXT PRIMARY KEY,
  username TEXT UNIQUE,
  password TEXT,
  team TEXT
);

--Create table of teams
CREATE TABLE Team (
  name TEXT PRIMARY KEY
);

--Create table of all confirmed matches
CREATE TABLE Match (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  team1 TEXT NOT NULL,
  team2 TEXT NOT NULL,
  date TEXT NOT NULL,
  time TEXT,
  score TEXT,
  FOREIGN KEY (team1) REFERENCES Team (name),
  FOREIGN KEY (team2) REFERENCES Team (name)
);

--Create table of logs
CREATE TABLE UserLog (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ip TEXT NOT NULL,
  user TEXT,
  date TEXT NOT NULL,
  time TEXT NOT NULL,
  method TEXT NOT NULL,
  url TEXT NOT NULL,
  protocol TEXT NOT NULL,
  httpVersion TEXT NOT NULL,
  secure INTEGER NOT NULL,
  statusCode INTEGER NOT NULL,
  referer TEXT,
  userAgent TEXT NOT NULL,
  username TEXT,
  FOREIGN KEY (username) REFERENCES User (username)
);

--Insert all 32 teams into Team table
INSERT INTO Team VALUES ('Netherlands');
INSERT INTO Team VALUES ('Senegal');
INSERT INTO Team VALUES ('Ecuador');
INSERT INTO Team VALUES ('Qatar');
INSERT INTO Team VALUES ('England');
INSERT INTO Team VALUES ('USA');
INSERT INTO Team VALUES ('Iran');
INSERT INTO Team VALUES ('Wales');
INSERT INTO Team VALUES ('Argentina');
INSERT INTO Team VALUES ('Poland');
INSERT INTO Team VALUES ('Mexico');
INSERT INTO Team VALUES ('Saudi Arabia');
INSERT INTO Team VALUES ('France');
INSERT INTO Team VALUES ('Australia');
INSERT INTO Team VALUES ('Tunisia');
INSERT INTO Team VALUES ('Denmark');
INSERT INTO Team VALUES ('Japan');
INSERT INTO Team VALUES ('Spain');
INSERT INTO Team VALUES ('Germany');
INSERT INTO Team VALUES ('Costa Rica');
INSERT INTO Team VALUES ('Morocco');
INSERT INTO Team VALUES ('Croatia');
INSERT INTO Team VALUES ('Belgium');
INSERT INTO Team VALUES ('Canada');
INSERT INTO Team VALUES ('Brazil');
INSERT INTO Team VALUES ('Switzerland');
INSERT INTO Team VALUES ('Cameroon');
INSERT INTO Team VALUES ('Serbia');
INSERT INTO Team VALUES ('Portugal');
INSERT INTO Team VALUES ('South Korea');
INSERT INTO Team VALUES ('Uruguay');
INSERT INTO Team VALUES ('Ghana');

-- Insert past matches into Match table
INSERT INTO Match (team1, team2, date, score) VALUES ('Qatar', 'Ecuador', '2022-11-20', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('England', 'Iran', '2022-11-21', '6-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Senegal', 'Netherlands', '2022-11-21', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('USA', 'Wales', '2022-11-21', '1-1');

INSERT INTO Match (team1, team2, date, score) VALUES ('Argentina', 'Saudi Arabia', '2022-11-22', '1-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Denmark', 'Tunisia', '2022-11-22', '0-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Mexico', 'Poland', '2022-11-22', '0-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Frank', 'Australia', '2022-11-22', '4-1');

INSERT INTO Match (team1, team2, date, score) VALUES ('Morocco', 'Croatia', '2022-11-23', '0-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Germany', 'Japan', '2022-11-23', '1-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Spain', 'Costa Rica', '2022-11-23', '7-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Belgium', 'Canada', '2022-11-23', '1-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Switzerland', 'Cameroon', '2022-11-24', '1-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Uruguay', 'South Korea', '2022-11-24', '0-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Portugal', 'Ghana', '2022-11-24', '3-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Brazil', 'Serbia', '2022-11-24', '2-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Wales', 'Iran', '2022-11-25', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Qatar', 'Senegal', '2022-11-25', '1-3');
INSERT INTO Match (team1, team2, date, score) VALUES ('Netherlands', 'Ecuador', '2022-11-25', '1-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('England', 'USA', '2022-11-25', '0-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Tunisia', 'Australia', '2022-11-26', '0-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Poland', 'Saudi Arabia', '2022-11-26', '2-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('France', 'Denmark', '2022-11-26', '2-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Argentina', 'Mexico', '2022-11-26', '2-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Japan', 'Costa Rica', '2022-11-27', '0-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Belgium', 'Morocco Rica', '2022-11-27', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Croatia', 'Canada Rica', '2022-11-27', '4-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Spain', 'Germany', '2022-11-27', '1-1');

INSERT INTO Match (team1, team2, date, score) VALUES ('Cameroon', 'Serbia', '2022-11-28', '3-3');
INSERT INTO Match (team1, team2, date, score) VALUES ('South Korea', 'Ghana', '2022-11-28', '2-3');
INSERT INTO Match (team1, team2, date, score) VALUES ('Brazil', 'Switzerland', '2022-11-28', '1-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Portugal', 'Uruguay', '2022-11-28', '2-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Ecuador', 'Senegal', '2022-11-29', '1-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Netherlands', 'Qatar', '2022-11-29', '2-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Iran', 'USA', '2022-11-29', '0-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Wales', 'England', '2022-11-29', '0-3');

INSERT INTO Match (team1, team2, date, score) VALUES ('Tunisia', 'France', '2022-11-30', '1-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Australia', 'Denmark', '2022-11-30', '1-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Poland', 'Argentina', '2022-11-30', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Saudi Arabia', 'Mexico', '2022-11-30', '1-2');

INSERT INTO Match (team1, team2, date, score) VALUES ('Croatia', 'Belgium', '2022-12-01', '0-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Canada', 'Morocco', '2022-12-01', '1-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Japan', 'Spain', '2022-12-01', '2-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Costa Rica', 'Germany', '2022-12-01', '2-4');

INSERT INTO Match (team1, team2, date, score) VALUES ('South Korea', 'Portugal', '2022-12-02', '2-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Ghana', 'Uruguay', '2022-12-02', '0-2');
INSERT INTO Match (team1, team2, date, score) VALUES ('Serbia', 'Switzerland', '2022-12-02', '2-3');
INSERT INTO Match (team1, team2, date, score) VALUES ('Cameroon', 'Brazil', '2022-12-02', '1-0');

INSERT INTO Match (team1, team2, date, score) VALUES ('Netherlands', 'USA', '2022-12-03', '3-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Argentina', 'Australia', '2022-12-03', '2-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('France', 'Poland', '2022-12-04', '3-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('England', 'Senegal', '2022-12-04', '3-0');
INSERT INTO Match (team1, team2, date, score) VALUES ('Japan', 'Croatia', '2022-12-05', '1(1)-1(3)');
INSERT INTO Match (team1, team2, date, score) VALUES ('Brazil', 'South Korea', '2022-12-05', '4-1');
INSERT INTO Match (team1, team2, date, score) VALUES ('Morocco', 'Spain', '2022-12-06', '0(3)-0(0)');
INSERT INTO Match (team1, team2, date, score) VALUES ('Portugal', 'Switzerland', '2022-12-06', '6-1');

-- Insert upcoming matches into Match table
INSERT INTO Match (team1, team2, date, time) VALUES ('Croatia', 'Brazil', '2022-12-09','10:00:00');
INSERT INTO Match (team1, team2, date, time) VALUES ('Netherlands', 'Argentina', '2022-12-09','14:00:00');
INSERT INTO Match (team1, team2, date, time) VALUES ('Morocco', 'Portugal', '2022-12-10','10:00:00');
INSERT INTO Match (team1, team2, date, time) VALUES ('England', 'France', '2022-12-10','14:00:00');

-- Down
DROP TABLE User;
DROP TABLE Team;
DROP TABLE Match;
DROP TABLE UserLog;
