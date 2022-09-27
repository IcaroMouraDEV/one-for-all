SELECT 
  TRUNCATE(MIN(p.valor), 2) AS 'faturamento_minimo',
  TRUNCATE(MAX(p.valor), 2) AS 'faturamento_maximo',
  TRUNCATE(AVG(p.valor), 2) AS 'faturamento_medio',
  TRUNCATE(SUM(p.valor), 2) AS 'faturamento_total'
FROM SpotifyClone.plano AS p
INNER JOIN SpotifyClone.usuario AS u
  ON p.id = u.plano_id;