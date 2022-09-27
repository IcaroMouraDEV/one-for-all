SELECT u.nome AS 'usuario',
    IF (MAX(YEAR(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
  FROM SpotifyClone.usuario AS u
 INNER JOIN SpotifyClone.historico AS h
    ON u.id = h.usuario_id
 GROUP BY usuario
 ORDER BY usuario ASC;