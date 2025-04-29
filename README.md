# Bot Discord com APIs de Gatos e Cachorros

Este projeto é um bot para o Discord desenvolvido em Elixir utilizando a biblioteca Nostrum. Ele interage com APIs externas para trazer imagens e fatos aleatórios sobre gatos e cachorros. O bot responde a comandos específicos enviados pelos usuários no Discord.

## Funcionalidades

O bot suporta os seguintes comandos:

- `!ping`: Responde com "Pong!".
- `!gato`: Retorna uma imagem aleatória de um gato.
- `!gatofato`: Retorna um fato aleatório sobre gatos.
- `!cachorro`: Retorna uma imagem aleatória de um cachorro.
- `!cachorrofato`: Retorna um fato aleatório sobre cachorros.

## Tecnologias Utilizadas

- **Elixir**: Linguagem de programação funcional usada para desenvolver o bot.
- **Nostrum**: Biblioteca Elixir para interagir com a API do Discord.

### APIs Externas

- **ApiCat**: API para obter imagens e fatos aleatórios de gatos.
- **ApiCatFact**: API para obter fatos aleatórios sobre gatos.
- **ApiDog**: API para obter imagens e fatos aleatórios de cachorros.
- **ApiDogFact**: API para obter fatos aleatórios sobre cachorros.

## Como Rodar o Projeto

### ✅ Pré-requisitos

Certifique-se de ter o Elixir instalado em sua máquina. Caso não tenha, você pode seguir a documentação oficial para instalar: [Instalar Elixir](https://elixir-lang.org/install.html).

Além disso, será necessário configurar uma conta no Discord e criar um bot, gerando um token de acesso.

---

### 📥 Passo 1: Clonar o Repositório

Clone o repositório para sua máquina local:

```bash
git clone https://github.com/FelipeMoura11/bot-discord.git
```

### 📦 Passo 2: Instalar Dependências
Dentro do diretório do projeto, instale as dependências necessárias:
```bash
cd bot-discord
mix deps.get
```
### 🔐 Passo 3: Configurar o Token do Bot
Crie um arquivo de configuração config/config.exs e adicione o token do seu bot do Discord:
```bash
use Mix.Config

config :nostrum,
  token: "SEU_TOKEN_AQUI"
```
Substitua "SEU_TOKEN_AQUI" pelo token do seu bot, que pode ser obtido após criar o bot no Discord Developer Portal.

### ▶️ Passo 4: Rodar o Bot
Para iniciar o bot, execute o comando abaixo:
```bash
iex -S mix
```
Agora, seu bot estará online e pronto para responder aos comandos no seu servidor Discord.
