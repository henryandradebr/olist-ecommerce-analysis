# Olist E-commerce Analysis

![Status](https://img.shields.io/badge/status-completo-brightgreen)
![Python](https://img.shields.io/badge/Power-BI-yellow)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-orange)

## 🔹 Introdução

Este projeto realiza uma análise exploratória e cálculo de KPIs sobre dados de pedidos, clientes e produtos do **Olist**, um marketplace brasileiro.  
O objetivo é entender o comportamento dos clientes, tendências de pedidos e gerar métricas importantes para o negócio, como número de clientes ativos e pedidos entregues.

### Como baixar os dados do Olist

Os dados utilizados são públicos e disponibilizados pelo Olist no Kaggle:  
[Olist Brazilian E-commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

Após baixar, coloque os arquivos na pasta `raw_data/` (essa pasta não está versionada).

As principais tabelas utilizadas neste projeto são:

- **olist_customers_dataset**: informações sobre os clientes
- **olist_orders_dataset**: informações sobre pedidos, datas e status
- **olist_order_items_dataset**: informações sobre os itens dos pedidos
- **olist_products_dataset**: informações sobre produtos e categorias

Outras tabelas (pagamentos, entregas, avaliações) podem ser incluídas para análises adicionais.

## Estrutura do Projeto

```
OLIST/
├── imgs/                  # Prints
├── power-bi/              # Projeto BI
├── sql/
│   ├── eda_queries.sql    # Queries de exploração
│   └── kpi_queries.sql    # Queries com os KPIs
└── README.md              # Apresentaçao do projeto
```

## 🔹 Ferramentas utilizadas

- **PostgreSQL + DBeaver**: SQL para exploração e transformação de dados
- **Power BI**: visualização de gráficos e tendências
- **Visual Studio Code (vscode)**: Criar estrutura de pastas e documentação
- **Git / GitHub**: Versionamento e apresentação do portfólio

## 🔹 Exploração de Dados (EDA)

As queries de EDA foram desenvolvidas para entender padrões e comportamentos:

1. **Top 10 clientes por número de pedidos**
   - Descobre os clientes mais ativos
   - Identifica concentração de pedidos em poucos clientes

2. **Pedidos por status**
   - Mostra a proporção de pedidos entregues, cancelados ou em andamento
   - Permite identificar possíveis problemas logísticos

3. **Pedidos por mês**
   - Analisa tendência de pedidos ao longo do tempo
   - Detecta sazonalidade ou picos de vendas

4. **Média móvel diária**
   - Suaviza picos e quedas nos pedidos diários
   - Facilita análise de tendências e planejamento de estoque/logística

## 🔹 KPIs (exemplos)

- **Clientes ativos**: número de clientes que fizeram pelo menos 1 pedido
- **Pedidos entregues**: total de pedidos com status `delivered`
- **Pedidos cancelados**: total de pedidos cancelados
- **Top clientes**: clientes com maior número de pedidos
- **Pedidos por categoria de produto**: distribuição de vendas por categoria

## 🔹 Visualizações

- **Gráficos de barras** → top clientes e pedidos por categoria
- **Gráficos de pizza** → distribuição de status de pedidos
- **Gráfico de linha** → evolução de pedidos por mês
- **Gráfico de linha sobreposta** → total diário + média móvel
