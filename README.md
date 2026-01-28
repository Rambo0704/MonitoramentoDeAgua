# 💧 Monitoramento de Consumo de Água

## 📌 Descrição do Projeto

Este projeto consiste na **modelagem e implementação de um banco de dados relacional em SQL** para o monitoramento de consumo de água. O objetivo é registrar leituras de consumo, garantir a integridade dos dados e disponibilizar consultas e relatórios que auxiliem na análise do uso de água ao longo do tempo.

O projeto foi desenvolvido com foco em **boas práticas de banco de dados**, aplicando regras de negócio diretamente no SGBD.

---

## 🎯 Objetivos

* Modelar um banco de dados para controle de consumo de água
* Garantir integridade e consistência dos dados
* Automatizar validações e cálculos no banco
* Facilitar a geração de relatórios de consumo

---

## 🛠️ Tecnologias Utilizadas

* **SQL**
* Conceitos de banco de dados relacional
* Recursos avançados de SQL:

  * Views
  * Functions
  * Triggers
  * Índices
  * Chaves primárias e estrangeiras

---

## 🧱 Estrutura do Banco de Dados

O banco de dados é composto por tabelas responsáveis por armazenar:

* Informações dos consumidores
* Registros de leituras de consumo
* Dados necessários para cálculo e análise do uso de água

A modelagem foi pensada para evitar redundâncias e garantir consistência através de relacionamentos bem definidos.

---

## ⚙️ Funcionalidades Implementadas

### ✔️ Tabelas

* Estruturação das entidades principais do sistema
* Uso de chaves primárias e estrangeiras

### ✔️ Views

* Criação de *views* para facilitar consultas e relatórios
* Abstração de consultas complexas

### ✔️ Functions

* Funções SQL para cálculos automáticos
* Centralização de regras de negócio no banco

### ✔️ Triggers

* Validação automática de dados na inserção e atualização
* Identificação de **consumo inválido** (valores negativos ou incoerentes)
* Detecção automática de **consumo excessivo/anormal**, permitindo sinalização de leituras fora do padrão esperado
* Prevenção de dados inconsistentes no banco

### ✔️ Índices

* Otimização de consultas frequentes

---

## 📊 Exemplos de Consultas

Alguns exemplos de análises que podem ser realizadas com o banco:

* Consumo total por consumidor
* Consumo médio em determinado período
* Comparação de consumo entre meses

Essas consultas podem ser utilizadas para gerar relatórios e apoiar tomadas de decisão.

---

## 🚀 Como Utilizar

1. Clone este repositório:

```bash
git clone https://github.com/Rambo0704/MonitoramentoDeAgua.git
```

2. Execute o script SQL no seu SGBD de preferência (MySQL ou PostgreSQL):

```sql
MonitConsumoDeAgua.sql
```

3. Utilize as *views* e *functions* para realizar consultas e análises.

---

## 📚 Aprendizados

Com este projeto foi possível reforçar conhecimentos em:

* Modelagem de banco de dados
* SQL avançado
* Regras de negócio no banco
* Organização e documentação de projetos

---


---

💡 *Projeto desenvolvido com fins educacionais e para demonstração de habilidades em SQL.*
