SELECT
  u.nome AS 'usuario', 
  COUNT(h.musica_id) AS 'qt_de_musicas_ouvidas',
  ROUND(SUM(c.duracao)/60, 2) AS 'total_minutos'
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h
  ON u.id = h.usuario_id
INNER JOIN SpotifyClone.musica AS c
  ON h.musica_id = c.id
GROUP BY usuario
ORDER BY usuario ASC;