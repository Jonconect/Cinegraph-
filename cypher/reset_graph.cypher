// Remove todos os nós e relacionamentos
MATCH (n) DETACH DELETE n;

// Remove todas as constraints criadas
DROP CONSTRAINT user_id_unique IF EXISTS;
DROP CONSTRAINT movie_title_unique IF EXISTS;
DROP CONSTRAINT series_title_unique IF EXISTS;
DROP CONSTRAINT genre_name_unique IF EXISTS;
DROP CONSTRAINT actor_name_unique IF EXISTS;
DROP CONSTRAINT director_name_unique IF EXISTS;
