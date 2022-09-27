DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(30) NOT NULL,
      valor DECIMAL(10, 2)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE NOT NULL,

      FOREIGN KEY (plano_id) REFERENCES `SpotifyClone`.`plano` (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,

      FOREIGN KEY (artista_id) REFERENCES `SpotifyClone`.`artista` (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musica(
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      duracao INT NOT NULL,
      ano_lancamento INT NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,

      FOREIGN KEY (artista_id) REFERENCES `SpotifyClone`.`artista` (id),
      FOREIGN KEY (album_id) REFERENCES `SpotifyClone`.`album` (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      usuario_id INT NOT NULL,
      musica_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,

      PRIMARY KEY(usuario_id, musica_id),
      FOREIGN KEY (usuario_id) REFERENCES `SpotifyClone`.`usuario` (id),
      FOREIGN KEY (musica_id) REFERENCES `SpotifyClone`.`musica` (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguidores(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,

      PRIMARY KEY(usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES `SpotifyClone`.`usuario` (id),
      FOREIGN KEY (artista_id) REFERENCES `SpotifyClone`.`artista` (id)
  ) engine = InnoDB;

INSERT INTO `SpotifyClone`.`plano` (nome, valor)
VALUES
	('gratuito', 0.00),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);

INSERT INTO `SpotifyClone`.`usuario` (nome, idade, plano_id, data_assinatura)
VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO `SpotifyClone`.`artista` (nome)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO `SpotifyClone`.`album` (nome, artista_id)
VALUES
	('Renaissance', 1),
	('Jazz', 2),
	('Hot Space', 2),
	('Falso Brilhante', 3),
	('Vento de Maio', 3),
	('QVVJFA?', 4),
	('Somewhere Far Beyond', 5),
	('I Put A Spell On You', 6);

INSERT INTO `SpotifyClone`.`musica` (nome, duracao, ano_lancamento, artista_id, album_id)
VALUES
	('BREAK MY SOUL', 279, 2022, 1, 1),
  ('VIRGO’S GROOVE', 369, 2022, 1, 1),
  ('ALIEN SUPERSTAR', 116, 2022, 1, 1),
  ('Don’t Stop Me Now', 203, 1978, 2, 2),
  ('Under Pressure', 152, 1982, 2, 3),
  ('Como Nossos Pais', 105, 1998, 3, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 3, 5),
  ('Samba em Paris', 267, 2003, 4, 6),
  ('The Bard’s Song',	244, 2007, 5, 7),
  ('Feeling Good', 100,	2012, 6, 8);

INSERT INTO `SpotifyClone`.`historico` (usuario_id, musica_id, data_reproducao)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
VALUES 
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);