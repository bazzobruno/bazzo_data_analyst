# 🌦️ Projeto ETL Meteorologia - SQLite

Este projeto realiza um pipeline completo de ETL (Extração, Transformação e Carga) para dados meteorológicos simulados da região Sudeste do Brasil. Utilizando Python, Pandas e SQLite, o projeto visa tanto a automação de ingestão de dados quanto análises exploratórias e validação de qualidade.

---

## 🛠️ Tecnologias Utilizadas

<p align="left">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white"/>
  <img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Matplotlib-11557C?style=for-the-badge&logo=matplotlib&logoColor=white"/>
  <img src="https://img.shields.io/badge/Seaborn-76B900?style=for-the-badge&logo=seaborn&logoColor=white"/>
</p>

---

## 🎯 Objetivos

- Automatizar a leitura e inserção de dados climáticos hora a hora em um banco de dados relacional.
- Criar visualizações e análises avançadas com foco em padrões climáticos e anomalias.
- Validar a consistência dos dados coletados e garantir integridade das informações armazenadas.

---

## 📊 Análises Realizadas

- Médias, máximas e mínimas por estação, data e região.
- Séries temporais para temperatura, umidade e precipitação.
- Detecção de outliers e dados ausentes.
- Visualizações em gráficos de linha, barras e heatmaps.

---

## 🔍 Validações e Testes

- Verificação de tipos e colunas obrigatórias.
- Testes de unicidade de chaves primárias.
- Checagem de integridade referencial (datas e locais).
- Scripts automatizados com feedback em tempo real.

---

## 🧱 Estrutura de Arquivos

- `etl.py`: script principal de ingestão e transformação.
- `weather_etl.ipynb`: notebook interativo com fluxo base de ETL.
- `weather_advanced_analysis.ipynb`: análises visuais e correlações.
- `weather_validation_and_tests.ipynb`: testes unitários e validações.
- `hourly-weather-southeast.csv`: conjunto de dados simulados.
- `weather.db`: banco de dados gerado (SQLite).
- `schema.sql`: criação do schema de banco.
- `config.py`: string de conexão e variáveis globais.
- `requirements.txt`: dependências do ambiente.