-- Active: 1688235154457@@127.0.0.1@5432@cloudgame@public

CREATE TABLE
    Users(
        id SERIAL PRIMARY KEY,
        nome_completo VARCHAR(150),
        login VARCHAR(100) UNIQUE,
        senha VARCHAR(50),
        email VARCHAR(50),
        cpf CHAR(11),
        rg VARCHAR(20),
        data_nasc DATE
    );

CREATE TABLE
    Games(
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        genero VARCHAR(100),
        data_lancamento DATE
    );

CREATE TABLE
    Plataform(
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100)
    );

CREATE TABLE
    Users_games(
        id SERIAL PRIMARY KEY,
        users_id INTEGER,
        games_id INTEGER,
        data_aquisicao DATE,
        Foreign Key (users_id) REFERENCES Users(id),
        Foreign Key (games_id) REFERENCES Games(id)
    );

CREATE TABLE
    Games_plataform(
        id SERIAL PRIMARY KEY,
        games_id INTEGER,
        plataform_id INTEGER,
        Foreign Key (games_id) REFERENCES Games(id),
        Foreign Key (plataform_id) REFERENCES Plataform(id)
    );

CREATE TABLE
    Videos_game (
        id SERIAL PRIMARY KEY,
        games_id INTEGER,
        url_video VARCHAR(250),
        Foreign Key (games_id) REFERENCES Games(id)
    );

CREATE TABLE
    Fotos_game (
        id SERIAL PRIMARY KEY,
        games_id INTEGER,
        url_fotos VARCHAR(250),
        Foreign Key (games_id) REFERENCES Games(id)
    );

/*INSERIR DADOS NA TABELA*/

INSERT INTO
    games(nome, genero, data_lancamento)
VALUES (
        'The Sims 4 Base',
        'Simulação da Vida Real',
        '2023-07-01'
    );

INSERT INTO plataform(nome)
VALUES ('Plastation 4'), ('Playstation 5'), ('Desktop');

INSERT INTO
    users(
        nome_completo,
        login,
        senha,
        email,
        cpf,
        rg,
        data_nasc
    )
VALUES (
        'Derpson da Silva',
        'derpinho',
        'derpinho91',
        'derpinho91@hotmail.com',
        '12312312312',
        '4.123.123',
        '1991-01-01'
    );

/*variáveis temporarias para obter ID do jogo - ADICIONA NA TABELA users_games, OS IDs DO USUÁRIO, DO JOGO SETADO E A DATA QUE AQUISIÇÃO */

WITH game AS (
        SELECT id
        FROM Games
        WHERE
            nome = 'The Sims 4 Base'
    )
    /*Inserir o jogo encontrado na lib do usuario "users_games"*/
INSERT INTO
    users_games(
        users_id,
        games_id,
        data_aquisicao
    )
SELECT
    u.id,
    g.id,
    CURRENT_DATE
FROM users u
    JOIN game g ON true
WHERE u.login = 'derpinho';

INSERT INTO
    games_plataform(games_id, plataform_id)
SELECT g.id, p.id
FROM games g
    CROSS JOIN plataform P
WHERE
    P.nome IN (
        'Playstation 4',
        'Playstation 4',
        'Desktop'
    );

