# 🌦️ Tutorial Detalhado: Projeto ETL de Dados Meteorológicos

Este documento explica **passo a passo** todos os arquivos do projeto ETL, com foco em **educação**, **entendimento lógico** e **documentação para leigos**.

---

## 📁 Estrutura do Projeto

```
.
├── etl.py                   <- Código principal do pipeline ETL
├── config.py                <- Configuração da conexão com SQLite
├── schema.sql               <- Criação das tabelas no banco
├── hourly-weather-southeast.csv <- Arquivo com dados meteorológicos simulados
├── weather.db               <- Banco de dados SQLite gerado automaticamente
├── requirements.txt         <- Dependências do projeto
├── README.md                <- Explicação do projeto
└── weather_unified_with_tests.ipynb <- Notebook explicativo unificado
```

---

## 📜 Explicação dos Arquivos

### `etl.py`

```python
import pandas as pd
from sqlalchemy import create_engine
from config import DB_URL
```
- `pandas`: biblioteca usada para ler, processar e manipular dados em tabelas.
- `sqlalchemy`: facilita a conexão entre Python e banco de dados (no caso, SQLite).
- `DB_URL`: caminho do banco de dados definido no `config.py`.

```python
weather = pd.read_csv("hourly-weather-southeast.csv")
```
- Lê o CSV com dados como temperatura, umidade, vento etc.
- Cria um `DataFrame`, que é uma tabela manipulável com Python.

```python
weather["datetime"] = pd.to_datetime(weather["datetime"])
```
- Converte a coluna `datetime` para o tipo data/hora reconhecível pelo Python.

```python
weather.fillna(method='ffill', inplace=True)
```
- Preenche valores vazios copiando o valor da linha anterior.

```python
weather["date"] = weather["datetime"].dt.date
weather_daily = weather.groupby(["station", "date"]).agg({...}).reset_index()
```
- Cria nova coluna apenas com a data (sem hora).
- Agrupa os dados por estação e data e calcula médias.

```python
engine = create_engine(DB_URL)
weather.to_sql(...); weather_daily.to_sql(...)
```
- Conecta ao banco e exporta as tabelas `weather_hourly` e `weather_daily`.

---

### `config.py`

```python
DB_URL = "sqlite:///weather.db"
```
- String de conexão padrão para SQLite.
- SQLite salva os dados localmente em `weather.db`.

---

### `schema.sql`

```sql
CREATE TABLE IF NOT EXISTS weather_hourly (...);
CREATE TABLE IF NOT EXISTS weather_daily (...);
```
- Comandos SQL para criar as tabelas manualmente (opcional).

---

### `weather_unified_with_tests.ipynb`

- Combina todas as etapas: ETL, análise, testes e visualizações.
- Dividido em células explicativas com títulos e comentários em português claro.
- Ideal para estudo ou demonstração em portfólio.

---

### `requirements.txt`

```
pandas
SQLAlchemy
matplotlib
seaborn
plotly
```
- Lista bibliotecas necessárias. Instale com:
```bash
pip install -r requirements.txt
```

---

## 🔁 Pipeline ETL

1. 📥 **Extração**: lê dados do CSV
2. ⚙️ **Transformação**: limpa, converte, agrupa e calcula
3. 💾 **Carga**: grava em tabelas SQLite

---

## ✅ Testes Automatizados

- Verifica se tabelas existem no banco
- Verifica se colunas críticas existem
- Compara médias entre dados diários e horários

---

## 👤 Para quem é este projeto?

- Estudantes de Python
- Interessados em dados meteorológicos
- Pessoas construindo um portfólio de dados
- Quem deseja aprender ETL com SQLite

---

## 📚 Como rodar tudo?

```bash
pip install -r requirements.txt
python etl.py
```

Ou abra o notebook `weather_unified_with_tests.ipynb` no Jupyter ou Colab.
