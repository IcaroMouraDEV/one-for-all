SELECT 
  a.nome AS artista,
  al.nome AS album
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al
  ON al.artista_id = a.id
WHERE a.nome = "Elis Regina"
ORDER BY album ASC;