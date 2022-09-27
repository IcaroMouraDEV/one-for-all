SELECT m.nome AS 'cancao', COUNT(h.musica_id) AS 'reproducoes'
FROM SpotifyClone.musica AS m
INNER JOIN SpotifyClone.historico AS h
  ON m.id = h.musica_id
GROUP BY nome
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;