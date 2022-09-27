SELECT 
  a.nome AS artista,
  al.nome AS  album,
  COUNT(s.usuario_id) AS seguidores
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al
  ON al.artista_id = a.id
INNER JOIN SpotifyClone.seguidores AS s
  ON s.artista_id = a.id
GROUP BY 
  artista, album
ORDER by 
  seguidores DESC,
  artista ASC,
  album ASC;