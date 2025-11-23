// 1. Recommend Unwatched Movies by Favorite Directors / Recomendar filmes não assistidos de diretores favoritos
MATCH (u:User)-[:WATCHED]->(w1)<-[:DIRECTED]-(d:Director)-[:DIRECTED]->(w2:Movie)
WHERE NOT (u)-[:WATCHED]->(w2)
RETURN u.name AS usuario, w2.title AS recomendacao, d.name AS diretor
ORDER BY usuario;
╒════════════════╤═════════════════╤══════════════════╕
│usuario         │recomendacao     │diretor           │
╞════════════════╪═════════════════╪══════════════════╡
│"Bruno Silva"   │"Fire Horizon"   │"Helena Costa"    │
├────────────────┼─────────────────┼──────────────────┤
│"Diego Ramos"   │"Ghost Code"     │"Michael O’Reilly"│
├────────────────┼─────────────────┼──────────────────┤
│"Fernando Costa"│"The Last Portal"│"Farah Al-Mansour"│
├────────────────┼─────────────────┼──────────────────┤
│"Henrique Alves"│"Time Fragments" │"Claire Dubois"   │
├────────────────┼─────────────────┼──────────────────┤
│"João Pereira"  │"Lunar Guardian" │"Olivia Spencer"  │
└────────────────┴─────────────────┴──────────────────┘
// 2. Recommend Works from Favorite Genres (with duration) / Recomendar obras do mesmo gênero (com duração)
MATCH (u:User)-[:WATCHED]->(w1)-[:IN_GENRE]->(g:Genre)<-[:IN_GENRE]-(w2)
WHERE NOT (u)-[:WATCHED]->(w2)
  AND w2.title IS NOT NULL
  AND w2.duration IS NOT NULL
RETURN 
  u.name AS usuario,
  g.name AS genero_favorito,
  w2.title AS recomendacao,
  w2.duration AS duracao_minutos
ORDER BY usuario;
╒════════════════╤═══════════════╤═══════════════════╤═══════════════╕
│usuario         │genero_favorito│recomendacao       │duracao_minutos│
╞════════════════╪═══════════════╪═══════════════════╪═══════════════╡
│"Alice Monteiro"│"Action"       │"Mortal Prism"     │95             │
├────────────────┼───────────────┼───────────────────┼───────────────┤
│"Bruno Silva"   │"Thriller"     │"Ghost Code"       │110            │
├────────────────┼───────────────┼───────────────────┼───────────────┤
│"Diego Ramos"   │"Mystery"      │"The Formula"      │102            │
├────────────────┼───────────────┼───────────────────┼───────────────┤
│"Fernando Costa"│"Sci-Fi"       │"The Last Portal"  │105            │
├────────────────┼───────────────┼───────────────────┼───────────────┤
│"Henrique Alves"│"Fantasy"      │"Lunar Guardian"   │130            │
├────────────────┼───────────────┼───────────────────┼───────────────┤
│"João Pereira"  │"Horror"       │"Echoes of Silence"│108            │
└────────────────┴───────────────┴───────────────────┴───────────────┘
// 3. Recommend Popular Works Not Yet Watched (with duration & year) / Recomendar obras populares não vistas (com duração e ano)
MATCH (w)<-[:WATCHED]-(u2:User)
WITH w, COUNT(u2) AS popularidade
MATCH (u:User)
WHERE NOT (u)-[:WATCHED]->(w)
  AND w.title IS NOT NULL
  AND w.duration IS NOT NULL
RETURN 
  u.name AS usuario,
  w.title AS recomendacao,
  w.duration AS duracao_minutos,
  w.year AS ano_lancamento,
  popularidade
ORDER BY popularidade DESC;
╒════════════════╤═════════════════╤═══════════════╤══════════════╤════════════╕
│usuario         │recomendacao     │duracao_minutos│ano_lancamento│popularidade│
╞════════════════╪═════════════════╪═══════════════╪══════════════╪════════════╡
│"Bruno Silva"   │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Carla Souza"   │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Diego Ramos"   │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Elisa Ferreira"│"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Fernando Costa"│"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Gabriela Lima" │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Henrique Alves"│"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Isabela Rocha" │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"João Pereira"  │"Fire Horizon"   │120            │2023          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Alice Monteiro"│"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Bruno Silva"   │"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Diego Ramos"   │"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Elisa Ferreira"│"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Fernando Costa"│"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Gabriela Lima" │"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Henrique Alves"│"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Isabela Rocha" │"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"João Pereira"  │"Ghost Code"     │110            │2022          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Alice Monteiro"│"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Bruno Silva"   │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Carla Souza"   │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Diego Ramos"   │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Fernando Costa"│"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Gabriela Lima" │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Henrique Alves"│"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Isabela Rocha" │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"João Pereira"  │"The Last Portal"│105            │2021          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Alice Monteiro"│"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Bruno Silva"   │"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Carla Souza"   │"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Diego Ramos"   │"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Elisa Ferreira"│"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Fernando Costa"│"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Henrique Alves"│"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Isabela Rocha" │"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"João Pereira"  │"Time Fragments" │98             │2020          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Alice Monteiro"│"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Bruno Silva"   │"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Carla Souza"   │"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Diego Ramos"   │"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Elisa Ferreira"│"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Fernando Costa"│"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Gabriela Lima" │"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"Henrique Alves"│"Lunar Guardian" │130            │2019          │1           │
├────────────────┼─────────────────┼───────────────┼──────────────┼────────────┤
│"João Pereira"  │"Lunar Guardian" │130            │2019          │1           │
└────────────────┴─────────────────┴───────────────┴──────────────┴────────────┘

// 4. Recommend Unwatched Movies by Jhon Damasceno / Recomendar filmes não assistidos de Jhon Damasceno
MATCH (m:Movie)<-[:DIRECTED]-(d:Director {name:'Jhon Damasceno'})
WHERE NOT (m)<-[:WATCHED]-(:User)
RETURN m.title AS recomendacao, d.name AS diretor;
╒══════════════════╤════════════════╕
│recomendacao      │diretor         │
╞══════════════════╪════════════════╡
│"Invisible Legacy"│"Jhon Damasceno"│
└──────────────────┴────────────────┘
// 5. Recommend Popular Works to Users Without Watch History / Recomendações para usuários sem histórico
MATCH (u:User)
WHERE NOT (u)-[:WATCHED]->(:Movie) AND NOT (u)-[:WATCHED]->(:Series)
MATCH (w)<-[:WATCHED]-(u2:User)
WITH w, COUNT(u2) AS popularidade
RETURN u.name AS usuario, w.title AS recomendacao, popularidade
ORDER BY popularidade DESC
LIMIT 5;

response: No changes, no records
