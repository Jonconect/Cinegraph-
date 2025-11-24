# CineGraph

Modelo de Grafo para Streaming com Neo4j Aura

---

## 📖 Descrição / Description

### 🇧🇷 PT-BR

O **CineGraph** é um projeto criado para demonstrar, de forma prática, como bancos de dados em grafos podem aprimorar a análise e recomendação dentro de um serviço de streaming. Usando o **Neo4j Aura**, o projeto conecta usuários, filmes, séries, gêneros, atores e diretores em um único grafo, permitindo consultas naturais e altamente relacionadas.

O objetivo principal é mostrar como relações ajudam a entender o comportamento de consumo e a gerar sugestões personalizadas.

### 🇺🇸 EN

**CineGraph** is a graph-based project built to explore how Neo4j Aura can support smarter insights for a streaming service. It organizes users, movies, series, genres, actors, and directors as connected entities, enabling intuitive analytical queries and recommendation generation.

---

## 🧠 Diagrama do Modelo / Data Model Diagram

O diagrama a seguir representa a estrutura principal do grafo, destacando usuários, obras, gêneros e equipes criativas.
<img width="3304" height="2719" alt="Image" src="https://github.com/user-attachments/assets/742d68da-51ff-4739-91ae-ebb26e350f91" />

> 📎 Este diagrama está disponível na aba [Issues](https://github.com/Jonconect/Cinegraph-/issues/1)
>
> 📄 Detalhes técnicos em [`docs/modelo-grafo-streaming.md`](docs/modelo-grafo-streaming.md)

---

## 📁 Estrutura do Projeto / Project Structure

```
cinegraph/
├── README.md
├── docs/
│   └── modelo-grafo-streaming.md
├── cypher/
│   ├── constraints.cypher
│   ├── insights_cinegraph.cypher
│   ├── populate_nodes.cypher
│   ├── populate_relationships.cypher
│   ├── recommendations_cinegraph.cypher
│   └── reset_graph.cypher

└── LICENSE
```

Cada script tem uma função específica dentro da construção do grafo:

* **reset_graph.cypher**: Limpa completamente o banco.
* **constraints.cypher**: Cria constraints e índices.
* **populate_nodes.cypher**: Insere os nós (usuários, filmes, séries, diretores, atores e gêneros).
* **populate_relationships.cypher**: Cria todos os relacionamentos entre os nós.
* **insights_cinegraph.cypher**: Contém consultas analíticas.
* **recommendations_cinegraph.cypher**: Regras de recomendações inteligentes.

---

## 🚀 Como executar / How to run

### 🇧🇷 PT-BR

1. Instale o **Neo4j Aura** ou **Neo4j Desktop**.
2. Crie um banco de dados vazio.
3. Execute o script principal:

```
cypher/populate_graph.cypher
```

Esse script monta todo o grafo automaticamente — nós, relacionamentos, constraints e consultas.

### 🇺🇸 EN

1. Install **Neo4j Aura** or **Neo4j Desktop**.
2. Create an empty database.
3. Run the main setup script:

```
cypher/populate_graph.cypher
```

---

## 📊 Funcionalidades / Features

* 🔍 **Consultas analíticas** sobre consumo e padrões de uso
* 🎯 **Recomendações inteligentes** baseadas em comportamento
* 📊 **Insights de visualização** utilizando o grafo
* 🧹 **Reset completo do grafo** para recriação rápida

---

## 🧵 Modelo do Grafo — Visão Geral

### Nós principais:

* **User**: name, email, age
* **Movie**: title, year, duration, mainStyle
* **Series**: title, year, duration, mainStyle
* **Genre**: name
* **Director**: name, nationality
* **Actor**: name, birthYear

### Relacionamentos:

* **WATCHED** → (User → Movie/Series)
* **RATED** → avaliação do usuário
* **IN_GENRE** → classificação da obra
* **DIRECTED** → direção de filmes e séries
* **ACTED_IN** → participação de atores
* **RECOMMENDED** → sugestões personalizadas

---

## 📚 Exemplos de Consultas Cypher

### 🎯 Recomendações com base em diretores favoritos

```cypher
MATCH (u:User)-[:WATCHED]->(w1)<-[:DIRECTED]-(d:Director)-[:DIRECTED]->(w2:Movie)
WHERE NOT (u)-[:WATCHED]->(w2)
RETURN u.name AS usuario, w2.title AS recomendacao, d.name AS diretor;
```

### ⭐ Identificar o gênero favorito de cada usuário

```cypher
MATCH (u:User)-[:WATCHED]->(w)-[:IN_GENRE]->(g:Genre)
RETURN u.name AS usuario, g.name AS genero, COUNT(*) AS vezes
ORDER BY usuario, vezes DESC;
```

---

## 📌 Licença / License

Este projeto utiliza a licença **MIT**.
This project is licensed under the **MIT License**.

---

## 👤 Autor / Author

**Jônatas Damasceno do Nascimento** — Fortaleza, Ceará, Brasil

Projeto desenvolvido com foco em compreensão de grafos, modelagem de dados e construção de recomendações inteligentes para plataformas de streaming.

