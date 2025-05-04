# 🤖 Botzilla - Bot de Discord com Elixir

Botzilla é um bot de Discord desenvolvido em **Elixir** como parte de um projeto acadêmico. Ele integra múltiplas APIs externas e responde a comandos do Discord de maneira funcional e modular.

## 📚 Contexto Acadêmico

Este bot faz parte de um projeto da disciplina **Programação Funcional**, com os seguintes objetivos:

- Aplicar conceitos de programação funcional na prática.
- Utilizar **Elixir** como linguagem funcional moderna.
- Integrar múltiplas **APIs REST**.
- Modularizar o código com funções puras e responsabilidades bem definidas.
- Empacotar a aplicação usando **Docker** para facilitar a execução e entrega.

## 🔧 Tecnologias Utilizadas

- **Elixir**: Linguagem funcional usada para toda a lógica do bot.
- **Nostrum**: Biblioteca para integrar bots com a API do Discord.
- **Req**: Cliente HTTP moderno e simples usado para consumir as APIs externas.
- **Docker**: Empacotamento do projeto para execução em containers.


## Funcionalidades

Botzilla oferece os seguintes comandos:

- `!ping`: Responde com "Pong!" para testar a conexão do bot.
- `!gato`: Envia uma imagem aleatória de um gato.
- `!gatofato`: Envia um fato aleatório sobre gatos.
- `!clima`: Envia informações resumidas sobre o clima.
- `!piada`: Envia uma piada aleatória.
- `!nba <time>`: Pesquisa e envia informações sobre um time de basquete da NBA.
- `!jogoshoje`: Envia uma lista de jogos de futebol do dia.
- `!jogosgratis`: Envia uma lista de jogos gratuitos disponíveis para PC.

### APIs Integradas
- **Joke API**: Para piadas aleatórias.
- **Http.cat**: Para imagens de gatos aleatórias.
- **Meowfacts**: Para fatos aleatórios de gatos.
- **Weather API**: Para informações sobre o clima.
- **Balldontlie API**: Para informações sobre times de basquete da NBA.
- **Football API**: Para buscar os jogos de futebol do dia. 
- **FreeToGame API**: Para buscar jogos gratuitos para PC.

## Instalação

### Pré-requisitos

Antes de rodar o bot, você precisa ter o Elixir instalado na sua máquina. Se você ainda não tem o Elixir, você pode seguir as instruções de instalação no [site oficial do Elixir](https://elixir-lang.org/install.html).

### Rodando o Bot 🤖

1. Clone o repositório:

    ```bash
    git clone https://github.com/FelipeMoura11/bot-discord.git
    cd bot-discord
    ```

2. Instale as dependências:

    ```bash
    mix deps.get
    ```

3. Compile o projeto:

    ```bash
    mix compile
    ```

4. Execute o bot:

    ```bash
    mix run --no-halt
    ```

## Como Executar Usando Docker 🐳
Build da imagem:
``` bash
docker build -t botzilla 
```
Execução do container (substitua seu_token_aqui pelo seu token real):
``` bash
docker run -e DISCORD_BOT_TOKEN=seu_token_aqui botzilla
```
💡 Dica: Você também pode utilizar um arquivo .env com a variável DISCORD_BOT_TOKEN e incluir com --env-file .env.

Rodando Localmente (sem Docker)
Instale as dependências:

``` bash
mix deps.get
```
Inicie o bot:

``` bash
mix run --no-halt
```
Isso iniciará o Botzilla e o conectará ao seu servidor Discord, pronto para responder aos comandos configurados.



