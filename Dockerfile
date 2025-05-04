FROM elixir:1.18.3-alpine

# Dependências de compilação
RUN apk add --no-cache build-base git

# Define o diretório da aplicação
WORKDIR /app

# Copia arquivos de definição e instala deps
COPY mix.exs mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Copia o restante do projeto e compila
COPY . .
RUN mix compile

# Roda o bot
CMD ["mix", "run", "--no-halt"]
