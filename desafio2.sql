SELECT
  (SELECT COUNT(*) FROM SpotifyClone.musica) as `cancoes`,
  (SELECT COUNT(*) FROM SpotifyClone.artista) as `artistas`,
  (SELECT COUNT(*) FROM SpotifyClone.album) as `albuns`;
