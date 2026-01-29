# 💧 Monitoramento de Consumo de Água

## 📌 Descrição do Projeto

Este projeto consiste na **modelagem e implementação de um banco de dados relacional em SQL** para o monitoramento de consumo de água. O objetivo é registrar leituras de consumo, garantir a integridade dos dados e disponibilizar consultas e relatórios que auxiliem na análise do uso de água ao longo do tempo.

O projeto foi desenvolvido com foco em **boas práticas de banco de dados**, aplicando regras de negócio diretamente no SGBD, reduzindo dependência da camada de aplicação e aumentando a confiabilidade dos dados.

---

## 🎯 Objetivos

* Modelar um banco de dados para controle de consumo de água
* Garantir integridade e consistência dos dados
* Automatizar validações, cálculos e alertas no banco
* Facilitar a geração de relatórios de consumo
* Aplicar conceitos de segurança e controle de acesso

---

## 🛠️ Tecnologias Utilizadas

* **SQL**
* Banco de dados relacional (MySQL)
* Conceitos de modelagem relacional
* Recursos avançados de SQL:
  * Views
  * Functions
  * Triggers
  * Stored Procedures
  * Índices
  * Chaves primárias e estrangeiras
  * Controle de usuários e permissões

---

## 🧱 Estrutura do Banco de Dados

O banco de dados é composto por tabelas responsáveis por armazenar:

* Usuários do sistema
* Imóveis e contratos
* Hidrômetros
* Leituras de consumo
* Alertas automáticos de inconsistência ou consumo elevado

A modelagem foi pensada para **evitar redundâncias**, manter **integridade referencial** e garantir **consistência dos dados** por meio de relacionamentos bem definidos.

---

## ⚙️ Funcionalidades Implementadas

### ✔️ Tabelas

* Estruturação das entidades principais do sistema
* Uso de chaves primárias e estrangeiras
* Relacionamentos normalizados

---

### ✔️ Views

* Criação de *views* para facilitar consultas e relatórios
* Abstração de consultas complexas
* Apoio à análise de consumo ao longo do tempo

---

### ✔️ Functions

* Função para **geração automática de identificadores únicos (IDs)** com prefixo e caracteres aleatórios
* Função para cálculo de **consumo médio por usuário**
* Centralização de regras de negócio diretamente no banco

---

### ✔️ Stored Procedures

* Procedure para **criação de contratos**, validando:
  * Existência do usuário
  * Existência do hidrômetro
* Tratamento de erros utilizando `SIGNAL`

---

### ✔️ Triggers

* Preenchimento automático de datas de cadastro e leitura
* Atualização automática de timestamps
* Detecção de **consumo inválido** (valores negativos)
* Detecção automática de **consumo elevado/anormal**
* Geração automática de **alertas** ao identificar inconsistências
* Prevenção de dados inconsistentes no banco

---

### ✔️ Índices

* Otimização de consultas frequentes
* Melhoria de desempenho em operações de leitura

---

### ✔️ Usuários e Permissões

* Criação de usuários no SGBD
* Definição de permissões específicas por tipo de usuário
* Controle de acesso às tabelas, views e operações
* Aplicação do princípio do **menor privilégio**
* Garantia de segurança e separação de responsabilidades no banco de dados

---

## 📊 Exemplos de Análises Possíveis

Com este banco de dados, é possível realizar análises como:

* Consumo total por usuário
* Consumo médio por período
* Identificação de padrões de consumo
* Detecção de leituras fora do padrão esperado
* Monitoramento automático de situações anômalas

Essas análises podem ser utilizadas para **relatórios**, **auditorias** e **tomada de decisão**.

---
## 🏙️ Cenário de Uso

Este banco de dados pode ser utilizado por:
* Companhias de saneamento
* Condomínios residenciais
* Sistemas públicos de controle de consumo
* Plataformas de monitoramento ambiental

O foco é garantir confiabilidade dos dados, detectar anomalias automaticamente e fornecer base sólida para análises e decisões operacionais.

---

## Diagrama
<img width="2613" height="1774" alt="mermaid-diagram-2026-01-28-155508" src="https://github.com/user-attachments/assets/1a55c345-457b-435b-9a69-0f9ee2784a6d" />

