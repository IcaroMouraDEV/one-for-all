SELECT COUNT(*) AS 'quantidade_musicas_no_historico' 
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h 
  ON u.id = h.usuario_id 
GROUP BY u.nome 
HAVING u.nome = 'Barbara Liskov'