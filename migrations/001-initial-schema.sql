-- Up
CREATE TABLE User (
  email STRING PRIMARY KEY,
  username STRING UNIQUE,
  password STRING,
  team STRING
);

CREATE TABLE Team (
  name STRING PRIMARY KEY
);

CREATE TABLE Match (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  team1 STRING NOT NULL,
  team2 STRING NOT NULL,
  date TEXT NOT NULL,
  time TEXT,
  score TEXT,
  FOREIGN KEY (team1) REFERENCES Team (name),
  FOREIGN KEY (team2) REFERENCES Team (name)
);

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

INSERT INTO Match (team1, team2, date, score) VALUES ('Qatar', 'Ecuador', '2022-11-20', '2-0');

-- Down
DROP TABLE User;
DROP TABLE Team;
DROP TABLE Match;
