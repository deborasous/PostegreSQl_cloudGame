-- Active: 1686696235256@@127.0.0.1@5432@cloudgames@public
CREATE TABLE Users(
  id SERIAL PRIMARY KEY,
  nome_completo VARCHAR(150),
  login VARCHAR(100) UNIQUE,
  senha VARCHAR(50),
  email VARCHAR(50),
  cpf CHAR(11),
  rg VARCHAR(20),
  data_nasc DATE
);

CREATE TABLE Games(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  genero VARCHAR(100),
  data_lancamento DATE
);

CREATE TABLE Plataform(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE Users_games(
  id SERIAL PRIMARY KEY,
  users_id INTEGER,
  games_id INTEGER,
  data_aquisicao DATE,
  Foreign Key (users_id) REFERENCES Users(id),
  Foreign Key (games_id) REFERENCES Games(id)
);

CREATE TABLE Games_plataform(
  id SERIAL PRIMARY KEY,
  games_id INTEGER,
  plataform_id INTEGER,
  Foreign Key (games_id) REFERENCES Games(id),
  Foreign Key (plataform_id) REFERENCES Plataform(id)
);

CREATE TABLE Videos_game (
  id SERIAL PRIMARY KEY,
  games_id INTEGER,
  url_video VARCHAR(250),
  Foreign Key (games_id) REFERENCES Games(id)
);

CREATE TABLE Fotos_game (
  id SERIAL PRIMARY KEY,
  games_id INTEGER,
  url_fotos VARCHAR(250),
  Foreign Key (games_id) REFERENCES Games(id)
);