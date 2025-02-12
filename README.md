## Coin Monitor

### Visão Geral

O Coin Monitor é uma aplicação web desenvolvida em Ruby on Rails para monitoramento de cotações de moedas (USD-BRL, EUR-BRL e BTC-BRL). Ele exibe gráficos dinâmicos de variação das moedas e permite visualizar dados históricos de até 16 dias.

### Tecnologias Utilizadas

* Ruby on Rails 8.0.1

* TailwindCSS para estilização

* Chartkick + Chart.js para gráficos

* Turbo Rails e Stimulus para interatividade

* SQLite3 como banco de dados

* API AwesomeAPI para obtenção dos valores das moedas

### Instalação e Configuração

**Requisitos:**

- Ruby instalado

- Bundler instalado (gem install bundler)

- Rails instalado (gem install rails)

**Passos**

Clone o repositório:
```
git clone https://github.com/seu-usuario/coin-monitor.git
cd coin-monitor
```
Instale as dependências:
```
bundle install
```
Configure o banco de dados:
```
rails db:setup
```
Inicie o servidor:
```
rails server
```
Acesse http://localhost:3000 no navegador.

---

### Estrutura do Código

**Rotas (config/routes.rb)**

- root "home#index" → Tela principal

- get "update_chart" → Atualização dinâmica dos gráficos

- get "latest_values" → Obtém os valores mais recentes das moedas

**Controlador (app/controllers/home_controller.rb)**

- index: Obtém e formata os dados das moedas

- latest_values: Atualiza os valores das moedas via API

**Visualização (app/views/home/index.html.erb)**

- Exibição dos gráficos

- Atualização automática dos valores a cada 30 segundos

- Botão para mostrar/ocultar lista de valores históricos

**Dependências (Gemfile)**

- chartkick: Gera gráficos interativos

- sqlite3: Banco de dados padrão

- turbo-rails e stimulus-rails: Interatividade

- tailwindcss-rails: Estilização

**Atualização dos Valores**

Os valores são atualizados automaticamente via API https://economia.awesomeapi.com.br/json/daily/.

- A API fornece dados de até 16 dias.

- A cada 30 segundos, os valores mais recentes são buscados e exibidos na interface.

---

### Melhorias Futuras

- Armazenamento dos dados no banco de dados local

- Opção para selecionar diferentes moedas

- Exportação de dados em CSV

---

### Autor

Alexandre Henrique Dorfler Schopf

[LinkedIn](https://www.linkedin.com/in/alexandre-dorfler)

[GitHub](https://github.com/AleexDevel0per)