# Explorador de Dados (GS---Cloud)

Aplicação web estática para explorar arquivos CSV diretamente no navegador. Ela oferece visão geral rápida do dataset, estatísticas por coluna e geração de gráficos em JavaScript e Python (via Pyodide), com interface totalmente em português.

## Funcionalidades
- **Upload de CSV ou uso de exemplo**: abra um arquivo local ou carregue `data/sample-data.csv` para experimentar.
- **Perfil automático do conjunto**: contagem de linhas/colunas, detecção de colunas numéricas e de texto, e metadados básicos.
- **Estatísticas**: mínimos, máximos e médias para colunas numéricas; categorias mais frequentes para colunas de texto.
- **Gráficos rápidos em JS**: barra com a coluna numérica mais informativa.
- **Gráficos em Python**: seleção de eixos X e Y, com opções de linha, colunas ou pizza, renderizadas via Pyodide e matplotlib.
- **Persistência local**: último dataset fica salvo no `localStorage` para reuso ao reabrir o site.

## Como executar
Como o projeto é estático, basta servir os arquivos. Uma forma simples é usar o Python já incluído no ambiente:

```bash
# na raiz do repositório
python -m http.server 8000
```

Depois acesse `http://localhost:8000` no navegador. A página inicial (`index.html`) mostra o carregamento e resumo do dataset, e a página `analytics.html` apresenta estatísticas detalhadas e os gráficos.

## Estrutura
- `index.html`: página inicial com upload/visualização rápida.
- `analytics.html`: painel de estatísticas e gráficos, incluindo a seção de gráficos em Python.
- `assets/js/common.js`: utilitários de parsing CSV, estatísticas e armazenamento local.
- `assets/js/analytics.js`: lógica específica da página de análises, controles e renderização dos gráficos Python.
- `assets/css/styles.css`: estilos e layout das páginas.
- `data/sample-data.csv`: conjunto de exemplo carregado automaticamente quando nada é enviado.

## Requisitos
- Navegador moderno com suporte a ES6 e fetch.
- Conexão com a internet para baixar Pyodide e pacotes Python (`matplotlib`, `numpy`) a partir da CDN.

## Contribuição
Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias, correções de bugs ou novas visualizações.
