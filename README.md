
# 🎬 CineGraph
> Graph-based streaming model with Neo4j Aura — Smart recommendations powered by user-content relationships

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Neo4j](https://img.shields.io/badge/Database-Neo4j-blue)

---

## 📖 Descrição / Description

**PT-BR**  
CineGraph é um projeto de banco de dados em grafos para um serviço de streaming, desenvolvido com Neo4j Aura. Ele modela relações entre usuários, filmes, séries, gêneros, atores e diretores, permitindo análises de consumo e geração de recomendações inteligentes.

**EN**  
CineGraph is a graph database project for a streaming service, built with Neo4j Aura. It models relationships between users, movies, series, genres, actors, and directors, enabling consumption analysis and smart recommendations.

---

## 🧠 Diagrama do modelo / Data model diagram

O grafo abaixo representa os principais nós e relacionamentos do CineGraph, incluindo usuários, filmes, gêneros, diretores e atores.

<img width="3304" height="2719" alt="Image" src="https://github.com/user-attachments/assets/742d68da-51ff-4739-91ae-ebb26e350f91" />
> 📎 Este diagrama está disponível na aba [Issues](https://github.com/Jonconect/Cinegraph-/issues/1)  
> 📄 Detalhes técnicos em [`docs/modelo-grafo-streaming.md`](docs/modelo-grafo-streaming.md)

---

## 📁 Estrutura do projeto / Project structure
cinegraph/ ├── README.md ├── docs/ │   └── modelo-grafo-streaming.md ├── cypher/ │   ├── constraints.cypher │   ├── insights_cinegraph.cypher │   ├── populate_nodes.cypher │   ├── populate_relationships.cypher │   ├── recommendations_cinegraph.cypher │   └── reset_graph.cypher ├── assets/ │   └── grafo-diagrama.png └── LICENSE
Esse script inclui:
• 	Reset do grafo
• 	Criação de constraints
• 	Inserção de nós e relacionamentos
• 	Painel de insights
• 	Recomendações inteligentes
EN
1. 	Install Neo4j Aura or Neo4j Desktop.
2. 	Create an empty database.
3. 	Run the main script:
cypher/populate_graph.cypher
This script includes:
• 	Graph reset
• 	Constraints creation
• 	Node and relationship insertion
• 	Insights panel
• 	Smart recommendations
---

## 🚀 Como executar / How to run

**PT-BR**
1. Instale o Neo4j Aura ou Neo4j Desktop.  
2. Crie um banco de dados vazio.  
3. Execute o script principal:

```plaintext
📊 Funcionalidades / Features
• 	🔍 Consultas analíticas / Analytical queries
• 	🎯 Recomendações inteligentes / Smart recommendations
• 	📊 Visualizações de consumo / Consumption insights
• 	🧹 Reset do grafo / Graph rese
cypher/populate_graph.cypher
// PT-BR: Recomendar filmes não assistidos de diretores favoritos
// EN: Recommend unwatched movies from favorite directors
MATCH (u:User)-[:WATCHED]->(w1)<-[:DIRECTED]-(d:Director)-[:DIRECTED]->(w2:Movie)
WHERE NOT (u)-[:WATCHED]->(w2)
RETURN u.name AS usuario, w2.title AS recomendacao, d.name AS diretor;

// PT-BR: Gênero favorito por usuário
// EN: Favorite genre per user
MATCH (u:User)-[:WATCHED]->(w)-[:IN_GENRE]->(g:Genre)
RETURN u.name AS usuario, g.name AS genero, COUNT(*) AS vezes
ORDER BY usuario, vezes DESC;

📌 Licença / License
Este projeto está licenciado sob a licença MIT.
This project is licensed under the MIT License.

👤 Autor / Author
Jõnatas
Fortaleza, Ceará – Brasil
Projeto desenvolvido com foco em aprendizado de grafos, modelagem de dados e recomendação inteligente.
