# Botzilla - Bot para Discord

**Botzilla** é um bot desenvolvido para o Discord, projetado para entreter e engajar os usuários com uma variedade de comandos interativos, como piadas, informações sobre o clima, jogos gratuitos, e muito mais! Este bot foi desenvolvido com Elixir e a biblioteca Nostrum para facilitar a interação com a API do Discord.

## Funcionalidades

Botzilla oferece os seguintes comandos:

- `!ping`: Responde com "Pong!" para testar a conexão do bot.
- `!gato`: Envia uma imagem aleatória de um gato.
- `!gatofato`: Envia um fato aleatório sobre gatos.
- `!clima`: Envia informações resumidas sobre o clima.
- `!piada`: Envia uma piada aleatória.
- `!nba <time>`: Pesquisa e envia informações sobre um time de basquete da NBA.
- `!jogos`: Envia uma lista de jogos de futebol.
- `!jogosgratis`: Envia uma lista de jogos gratuitos disponíveis para PC.

### APIs Integradas
- **Joke API**: Para piadas aleatórias.
- **Http.cat**: Para imagens de gatos aleatórias.
- **Meowfacts**: Para fatos aleatórios de gatos.
- **Weather API**: Para informações sobre o clima.
- **Balldontlie API**: Para informações sobre times de basquete da NBA.
- **Football API**: Envia uma lista de jogos de futebol do dia. 
- **FreeToGame API**: Para buscar jogos gratuitos para PC.

## Instalação

### Pré-requisitos

Antes de rodar o bot, você precisa ter o Elixir instalado na sua máquina. Se você ainda não tem o Elixir, você pode seguir as instruções de instalação no [site oficial do Elixir](https://elixir-lang.org/install.html).

### Rodando o Bot

1. Clone o repositório:

    ```bash
    git clone https://github.com/FelipeMoura11/botzilla.git
    cd botzilla
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

Isso iniciará o Botzilla no seu servidor Discord.
