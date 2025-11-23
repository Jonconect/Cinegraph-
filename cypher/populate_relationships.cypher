populate_relationships.cypher
//USER/WATCHED->Movies/Series:
MATCH (u:User {id:'u1'}), (m:Movie {title:'Fire Horizon'}) CREATE (u)-[:WATCHED {rating:4.5}]->(m);
MATCH (u:User {id:'u2'}), (s:Series {title:'Shadows of Tomorrow'}) CREATE (u)-[:WATCHED {rating:4.4}]->(s);
MATCH (u:User {id:'u3'}), (m:Movie {title:'Ghost Code'}) CREATE (u)-[:WATCHED {rating:4.2}]->(m);
MATCH (u:User {id:'u4'}), (s:Series {title:'Hidden Codes'}) CREATE (u)-[:WATCHED {rating:4.1}]->(s);
MATCH (u:User {id:'u5'}), (m:Movie {title:'The Last Portal'}) CREATE (u)-[:WATCHED {rating:4.0}]->(m);
MATCH (u:User {id:'u6'}), (s:Series {title:'Timeline'}) CREATE (u)-[:WATCHED {rating:4.3}]->(s);
MATCH (u:User {id:'u7'}), (m:Movie {title:'Time Fragments'}) CREATE (u)-[:WATCHED {rating:3.9}]->(m);
MATCH (u:User {id:'u8'}), (s:Series {title:'Parallel Worlds'}) CREATE (u)-[:WATCHED {rating:4.7}]->(s);
MATCH (u:User {id:'u9'}), (m:Movie {title:'Lunar Guardian'}) CREATE (u)-[:WATCHED {rating:4.8}]->(m);
MATCH (u:User {id:'u10'}), (s:Series {title:'Ghost City'}) CREATE (u)-[:WATCHED {rating:3.9}]->(s);
//Series/IN_GENRE->GENRE:
MATCH (s:Series {title:'Shadows of Tomorrow'}), (g:Genre {name:'Thriller'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Hidden Codes'}), (g:Genre {name:'Mystery'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Timeline'}), (g:Genre {name:'Sci-Fi'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Parallel Worlds'}), (g:Genre {name:'Fantasy'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Ghost City'}), (g:Genre {name:'Horror'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Secret Truths'}), (g:Genre {name:'Drama'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'The Guardian'}), (g:Genre {name:'Action'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Echoes of the Past'}), (g:Genre {name:'Romance'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Infinite Mystery'}), (g:Genre {name:'Mystery'}) CREATE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {title:'Lost Legacy'}), (g:Genre {name:'Documentary'}) CREATE (s)-[:IN_GENRE]->(g);
//Movie/In_GENRE->:
MATCH (m:Movie {title:'Fire Horizon'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Ghost Code'}), (g:Genre {name:'Thriller'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Last Portal'}), (g:Genre {name:'Sci-Fi'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Time Fragments'}), (g:Genre {name:'Romance'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Lunar Guardian'}), (g:Genre {name:'Fantasy'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Lost Connection'}), (g:Genre {name:'Drama'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'The Formula'}), (g:Genre {name:'Mystery'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Echoes of Silence'}), (g:Genre {name:'Horror'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Mortal Prism'}), (g:Genre {name:'Action'}) CREATE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {title:'Invisible Legacy'}), (g:Genre {name:'Documentary'}) CREATE (m)-[:IN_GENRE]->(g);
//ACTOR/ACTED_IN->MOVIE/SERIES
// Rafael Torres
MATCH (a:Actor {name:'Rafael Torres'}), (m:Movie {title:'Fire Horizon'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Rafael Torres'}), (s:Series {title:'Shadows of Tomorrow'}) CREATE (a)-[:ACTED_IN]->(s);

// Chloe Bennett
MATCH (a:Actor {name:'Chloe Bennett'}), (m:Movie {title:'Ghost Code'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Chloe Bennett'}), (s:Series {title:'Hidden Codes'}) CREATE (a)-[:ACTED_IN]->(s);

// Haruto Saito
MATCH (a:Actor {name:'Haruto Saito'}), (m:Movie {title:'The Last Portal'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Haruto Saito'}), (s:Series {title:'Timeline'}) CREATE (a)-[:ACTED_IN]->(s);

// Isabella Romano
MATCH (a:Actor {name:'Isabella Romano'}), (m:Movie {title:'Time Fragments'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Isabella Romano'}), (s:Series {title:'Parallel Worlds'}) CREATE (a)-[:ACTED_IN]->(s);

// Omar El-Masri
MATCH (a:Actor {name:'Omar El-Masri'}), (m:Movie {title:'Lunar Guardian'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Omar El-Masri'}), (s:Series {title:'Ghost City'}) CREATE (a)-[:ACTED_IN]->(s);

// Thandiwe Mokoena
MATCH (a:Actor {name:'Thandiwe Mokoena'}), (m:Movie {title:'Lost Connection'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Thandiwe Mokoena'}), (s:Series {title:'Secret Truths'}) CREATE (a)-[:ACTED_IN]->(s);

// Viktor Ivanov
MATCH (a:Actor {name:'Viktor Ivanov'}), (m:Movie {title:'The Formula'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Viktor Ivanov'}), (s:Series {title:'The Guardian'}) CREATE (a)-[:ACTED_IN]->(s);

// Aisha Khan
MATCH (a:Actor {name:'Aisha Khan'}), (m:Movie {title:'Echoes of Silence'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Aisha Khan'}), (s:Series {title:'Echoes of the Past'}) CREATE (a)-[:ACTED_IN]->(s);

// Lucas Andrade
MATCH (a:Actor {name:'Lucas Andrade'}), (m:Movie {title:'Mortal Prism'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Lucas Andrade'}), (s:Series {title:'Infinite Mystery'}) CREATE (a)-[:ACTED_IN]->(s);

// Linh Nguyen
MATCH (a:Actor {name:'Linh Nguyen'}), (m:Movie {title:'Invisible Legacy'}) CREATE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {name:'Linh Nguyen'}), (s:Series {title:'Lost Legacy'}) CREATE (a)-[:ACTED_IN]->(s);

//  Diretores de Filmes/Film Directors
MATCH (d:Director {name:'Helena Costa'}), (m:Movie {title:'Fire Horizon'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Michael O’Reilly'}), (m:Movie {title:'Ghost Code'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Farah Al-Mansour'}), (m:Movie {title:'The Last Portal'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Claire Dubois'}), (m:Movie {title:'Time Fragments'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Olivia Spencer'}), (m:Movie {title:'Lunar Guardian'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Zhang Wei'}), (m:Movie {title:'Lost Connection'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Sipho Dlamini'}), (m:Movie {title:'The Formula'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Carmen Delgado'}), (m:Movie {title:'Echoes of Silence'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Jae-Hoon Park'}), (m:Movie {title:'Mortal Prism'}) 
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Jhon Damasceno'}), (m:Movie {title:'Invisible Legacy'}) 
CREATE (d)-[:DIRECTED]->(m);

// Diretores de Séries/Series Directors 

MATCH (d:Director {name:'Helena Costa'}), (s:Series {title:'Shadows of Tomorrow'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Michael O’Reilly'}), (s:Series {title:'Hidden Codes'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Farah Al-Mansour'}), (s:Series {title:'Timeline'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Claire Dubois'}), (s:Series {title:'Parallel Worlds'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Olivia Spencer'}), (s:Series {title:'Ghost City'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Zhang Wei'}), (s:Series {title:'Secret Truths'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Sipho Dlamini'}), (s:Series {title:'The Guardian'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Carmen Delgado'}), (s:Series {title:'Echoes of the Past'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Jae-Hoon Park'}), (s:Series {title:'Infinite Mystery'}) 
CREATE (d)-[:DIRECTED]->(s);

MATCH (d:Director {name:'Jhon Damasceno'}), (s:Series {title:'Lost Legacy'}) 
CREATE (d)-[:DIRECTED]->(s);
