// 1. Most Watched Works / Obras mais assistidas
MATCH (u:User)-[:WATCHED]->(w)
RETURN w.title AS obra, COUNT(u) AS total_assistencias
ORDER BY total_assistencias DESC;
╒═════════════════════╤══════════════════╕
│obra                 │total_assistencias│
╞═════════════════════╪══════════════════╡
│"Fire Horizon"       │1                 │
├─────────────────────┼──────────────────┤
│"Shadows of Tomorrow"│1                 │
├─────────────────────┼──────────────────┤
│"Ghost Code"         │1                 │
├─────────────────────┼──────────────────┤
│"Hidden Codes"       │1                 │
├─────────────────────┼──────────────────┤
│"The Last Portal"    │1                 │
├─────────────────────┼──────────────────┤
│"Timeline"           │1                 │
├─────────────────────┼──────────────────┤
│"Time Fragments"     │1                 │
├─────────────────────┼──────────────────┤
│"Parallel Worlds"    │1                 │
├─────────────────────┼──────────────────┤
│"Lunar Guardian"     │1                 │
├─────────────────────┼──────────────────┤
│"Ghost City"         │1                 │
└─────────────────────┴──────────────────┘

// 2.Average Rating per Work / Média de avaliação por obra
MATCH (u:User)-[r:WATCHED]->(w)
RETURN w.title AS obra, ROUND(AVG(r.rating),2) AS media_avaliacao
ORDER BY media_avaliacao DESC;
╒═════════════════════╤═══════════════╕
│obra                 │media_avaliacao│
╞═════════════════════╪═══════════════╡
│"Lunar Guardian"     │4.8            │
├─────────────────────┼───────────────┤
│"Parallel Worlds"    │4.7            │
├─────────────────────┼───────────────┤
│"Fire Horizon"       │4.5            │
├─────────────────────┼───────────────┤
│"Shadows of Tomorrow"│4.4            │
├─────────────────────┼───────────────┤
│"Timeline"           │4.3            │
├─────────────────────┼───────────────┤
│"Ghost Code"         │4.2            │
├─────────────────────┼───────────────┤
│"Hidden Codes"       │4.1            │
├─────────────────────┼───────────────┤
│"The Last Portal"    │4.0            │
├─────────────────────┼───────────────┤
│"Time Fragments"     │3.9            │
├─────────────────────┼───────────────┤
│"Ghost City"         │3.9            │
└─────────────────────┴───────────────┘

// 3. Most Featured Actors / Atores mais presentes
MATCH (a:Actor)-[:ACTED_IN]->(w)
RETURN a.name AS ator, COUNT(w) AS total_obras
ORDER BY total_obras DESC;
╒══════════════════╤═══════════╕
│ator              │total_obras│
╞══════════════════╪═══════════╡
│"Rafael Torres"   │2          │
├──────────────────┼───────────┤
│"Chloe Bennett"   │2          │
├──────────────────┼───────────┤
│"Haruto Saito"    │2          │
├──────────────────┼───────────┤
│"Isabella Romano" │2          │
├──────────────────┼───────────┤
│"Omar El-Masri"   │2          │
├──────────────────┼───────────┤
│"Thandiwe Mokoena"│2          │
├──────────────────┼───────────┤
│"Viktor Ivanov"   │2          │
├──────────────────┼───────────┤
│"Aisha Khan"      │2          │
├──────────────────┼───────────┤
│"Lucas Andrade"   │2          │
├──────────────────┼───────────┤
│"Linh Nguyen"     │2          │
└──────────────────┴───────────┘
// 4. Most Productive Directors / Diretores mais produtivos
MATCH (d:Director)-[:DIRECTED]->(w)
RETURN d.name AS diretor, COUNT(w) AS total_dirigidos
ORDER BY total_dirigidos DESC;
╒══════════════════╤═══════════════╕
│diretor           │total_dirigidos│
╞══════════════════╪═══════════════╡
│"Helena Costa"    │2              │
├──────────────────┼───────────────┤
│"Zhang Wei"       │2              │
├──────────────────┼───────────────┤
│"Michael O’Reilly"│2              │
├──────────────────┼───────────────┤
│"Carmen Delgado"  │2              │
├──────────────────┼───────────────┤
│"Farah Al-Mansour"│2              │
├──────────────────┼───────────────┤
│"Jae-Hoon Park"   │2              │
├──────────────────┼───────────────┤
│"Claire Dubois"   │2              │
├──────────────────┼───────────────┤
│"Sipho Dlamini"   │2              │
├──────────────────┼───────────────┤
│"Olivia Spencer"  │2              │
├──────────────────┼───────────────┤
│"Jhon Damasceno"  │2              │
└──────────────────┴───────────────┘
// 5.Most Popular Genres / Gêneros mais populares
MATCH (u:User)-[:WATCHED]->(w)-[:IN_GENRE]->(g:Genre)
RETURN g.name AS genero, COUNT(DISTINCT u) AS total_espectadores
ORDER BY total_espectadores DESC;
╒══════════╤══════════════════╕
│genero    │total_espectadores│
╞══════════╪══════════════════╡
│"Thriller"│2                 │
├──────────┼──────────────────┤
│"Sci-Fi"  │2                 │
├──────────┼──────────────────┤
│"Fantasy" │2                 │
├──────────┼──────────────────┤
│"Action"  │1                 │
├──────────┼──────────────────┤
│"Mystery" │1                 │
├──────────┼──────────────────┤
│"Romance" │1                 │
├──────────┼──────────────────┤
│"Horror"  │1                 │
└──────────┴──────────────────┘
// 6. Users Without Watch History / Usuários sem histórico de consumo
MATCH (u:User)
WHERE NOT (u)-[:WATCHED]->(:Movie) AND NOT (u)-[:WATCHED]->(:Series)
RETURN u.name AS usuario_sem_assistir;
Resposta: No changes, no records(Sem alterações, sem registros.)
// 7. Unwatched Movies by Jhon Damasceno /Filmes não assistidos de Jhon Damasceno
MATCH (m:Movie)<-[:DIRECTED]-(d:Director {name:'Jhon Damasceno'})
WHERE NOT (m)<-[:WATCHED]-(:User)
RETURN m.title AS filme_nao_assistido;
╒═══════════════════╕
│filme_nao_assistido│
╞═══════════════════╡
│"Invisible Legacy" │
└───────────────────┘
// 8.User with Greatest Genre Diversity/ Usuário com maior diversidade de gêneros
MATCH (u:User)-[:WATCHED]->(w)-[:IN_GENRE]->(g:Genre)
RETURN u.name AS usuario, COUNT(DISTINCT g) AS generos_diferentes
ORDER BY generos_diferentes DESC;
╒════════════════╤══════════════════╕
│usuario         │generos_diferentes│
╞════════════════╪══════════════════╡
│"Alice Monteiro"│1                 │
├────────────────┼──────────────────┤
│"Bruno Silva"   │1                 │
├────────────────┼──────────────────┤
│"Carla Souza"   │1                 │
├────────────────┼──────────────────┤
│"Diego Ramos"   │1                 │
├────────────────┼──────────────────┤
│"Elisa Ferreira"│1                 │
├────────────────┼──────────────────┤
│"Fernando Costa"│1                 │
├────────────────┼──────────────────┤
│"Gabriela Lima" │1                 │
├────────────────┼──────────────────┤
│"Henrique Alves"│1                 │
├────────────────┼──────────────────┤
│"Isabela Rocha" │1                 │
├────────────────┼──────────────────┤
│"João Pereira"  │1                 │
└────────────────┴──────────────────┘
// 9. Works Never Watched/ Obras nunca assistidas
MATCH (w)
WHERE NOT (w)<-[:WATCHED]-(:User)
RETURN w.title AS obra_nao_assistida;
╒════════════════════╕
│obra_nao_assistida  │
╞════════════════════╡
│"Lost Connection"   │
├────────────────────┤
│"The Formula"       │
├────────────────────┤
│"Echoes of Silence" │
├────────────────────┤
│"Mortal Prism"      │
├────────────────────┤
│"Invisible Legacy"  │
├────────────────────┤
│"Secret Truths"     │
├────────────────────┤
│"The Guardian"      │
├────────────────────┤
│"Echoes of the Past"│
├────────────────────┤
│"Infinite Mystery"  │
├────────────────────┤
│"Lost Legacy"       │
└────────────────────┘
// 10.  Favorite Genre per User/Gênero favorito de cada usuário
MATCH (u:User)-[:WATCHED]->(w)-[:IN_GENRE]->(g:Genre)
RETURN u.name AS usuario, g.name AS genero, COUNT(*) AS vezes
ORDER BY usuario, vezes DESC;
╒════════════════╤══════════╤═════╕
│usuario         │genero    │vezes│
╞════════════════╪══════════╪═════╡
│"Alice Monteiro"│"Action"  │1    │
├────────────────┼──────────┼─────┤
│"Bruno Silva"   │"Thriller"│1    │
├────────────────┼──────────┼─────┤
│"Carla Souza"   │"Thriller"│1    │
├────────────────┼──────────┼─────┤
│"Diego Ramos"   │"Mystery" │1    │
├────────────────┼──────────┼─────┤
│"Elisa Ferreira"│"Sci-Fi"  │1    │
├────────────────┼──────────┼─────┤
│"Fernando Costa"│"Sci-Fi"  │1    │
├────────────────┼──────────┼─────┤
│"Gabriela Lima" │"Romance" │1    │
├────────────────┼──────────┼─────┤
│"Henrique Alves"│"Fantasy" │1    │
├────────────────┼──────────┼─────┤
│"Isabela Rocha" │"Fantasy" │1    │
├────────────────┼──────────┼─────┤
│"João Pereira"  │"Horror"  │1    │
└────────────────┴──────────┴─────┘

// 11.  Top 5 Highest Rated Works/Obras com maior nota média (Top 5)
MATCH (u:User)-[r:WATCHED]->(w)
RETURN w.title AS obra, ROUND(AVG(r.rating),2) AS media_avaliacao
ORDER BY media_avaliacao DESC
LIMIT 5;
╒═════════════════════╤═══════════════╕
│obra                 │media_avaliacao│
╞═════════════════════╪═══════════════╡
│"Lunar Guardian"     │4.8            │
├─────────────────────┼───────────────┤
│"Parallel Worlds"    │4.7            │
├─────────────────────┼───────────────┤
│"Fire Horizon"       │4.5            │
├─────────────────────┼───────────────┤
│"Shadows of Tomorrow"│4.4            │
├─────────────────────┼───────────────┤
│"Timeline"           │4.3            │
└─────────────────────┴───────────────┘
// 12. Directors with Unwatched Works /Diretores com obras não assistidas
MATCH (d:Director)-[:DIRECTED]->(w)
WHERE NOT (w)<-[:WATCHED]-(:User)
RETURN d.name AS diretor, COLLECT(w.title) AS obras_nao_assistidas;
╒════════════════╤═══════════════════════════════════════════╕
│diretor         │obras_nao_assistidas                       │
╞════════════════╪═══════════════════════════════════════════╡
│"Zhang Wei"     │["Lost Connection", "Secret Truths"]       │
├────────────────┼───────────────────────────────────────────┤
│"Carmen Delgado"│["Echoes of Silence", "Echoes of the Past"]│
├────────────────┼───────────────────────────────────────────┤
│"Jae-Hoon Park" │["Mortal Prism", "Infinite Mystery"]       │
├────────────────┼───────────────────────────────────────────┤
│"Sipho Dlamini" │["The Formula", "The Guardian"]            │
├────────────────┼───────────────────────────────────────────┤
│"Jhon Damasceno"│["Invisible Legacy", "Lost Legacy"]        │
└────────────────┴───────────────────────────────────────────┘
// 13.Actors in Popular Works/ Atores que mais aparecem em obras populares
MATCH (a:Actor)-[:ACTED_IN]->(w)<-[:WATCHED]-(u:User)
RETURN a.name AS ator, COUNT(DISTINCT u) AS total_espectadores
ORDER BY total_espectadores DESC;
╒═════════════════╤══════════════════╕
│ator             │total_espectadores│
╞═════════════════╪══════════════════╡
│"Rafael Torres"  │2                 │
├─────────────────┼──────────────────┤
│"Chloe Bennett"  │2                 │
├─────────────────┼──────────────────┤
│"Haruto Saito"   │2                 │
├─────────────────┼──────────────────┤
│"Isabella Romano"│2                 │
├─────────────────┼──────────────────┤
│"Omar El-Masri"  │2                 │
└─────────────────┴──────────────────┘
// 14. Most Critical Users /Usuários “críticos” (menor média de notas)
MATCH (u:User)-[r:WATCHED]->(w)
RETURN u.name AS usuario, ROUND(AVG(r.rating),2) AS media_usuario
ORDER BY media_usuario ASC;
╒════════════════╤═════════════╕
│usuario         │media_usuario│
╞════════════════╪═════════════╡
│"Gabriela Lima" │3.9          │
├────────────────┼─────────────┤
│"João Pereira"  │3.9          │
├────────────────┼─────────────┤
│"Elisa Ferreira"│4.0          │
├────────────────┼─────────────┤
│"Diego Ramos"   │4.1          │
├────────────────┼─────────────┤
│"Carla Souza"   │4.2          │
├────────────────┼─────────────┤
│"Fernando Costa"│4.3          │
├────────────────┼─────────────┤
│"Bruno Silva"   │4.4          │
├────────────────┼─────────────┤
│"Alice Monteiro"│4.5          │
├────────────────┼─────────────┤
│"Henrique Alves"│4.7          │
├────────────────┼─────────────┤
│"Isabela Rocha" │4.8          │
└────────────────┴─────────────┘
// 15.  Works Shared Between Users /Obras compartilhadas entre usuários
MATCH (u1:User)-[:WATCHED]->(w)<-[:WATCHED]-(u2:User)
WHERE u1 <> u2
RETURN w.title AS obra, COLLECT(DISTINCT u1.name) AS usuarios
ORDER BY SIZE(usuarios) DESC;
Respost: No changes, no records(Sem alterações, sem registros.)
