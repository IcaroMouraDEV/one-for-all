SELECT 
  m.nome AS 'nome',
  COUNT(h.musica_id) AS 'reproducoes'
FROM SpotifyClone.musica AS m
INNER JOIN SpotifyClone.historico AS h
  ON h.musica_id = m.id
INNER JOIN SpotifyClone.usuario AS u
  ON h.usuario_id = u.id
INNER JOIN SpotifyClone.plano AS p
  ON u.plano_id = p.id
WHERE u.plano_id IN (1, 4)
GROUP BY m.nome 
ORDER BY m.nome ASC;