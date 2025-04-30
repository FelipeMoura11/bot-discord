defmodule BotDiscord do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias BotDiscord.Command.ApiCat
  alias BotDiscord.Command.ApiCatFact
  alias BotDiscord.Command.ApiWeather
  alias BotDiscord.Command.ApiJoke
  alias BotDiscord.Command.NbaAPI
  alias BotDiscord.Command.FootballApi
  alias BotDiscord.Command.FreeToGame

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    content = msg.content

    cond do
      content == "!ping" ->
        Api.create_message(msg.channel_id, "Pong!")

      content == "!gato" ->
        imagem = ApiCat.imagem_aleatoria()
        Api.create_message(msg.channel_id, imagem)

      content == "!gatofato" ->
        resposta = ApiCatFact.fato_aleatorio()
        Api.create_message(msg.channel_id, "🐱 Fato aleatório: " <> resposta)

      content == "!clima" ->
        clima = ApiWeather.clima_resumido()
        Api.create_message(msg.channel_id, "🌤️ Clima: " <> clima)

      content == "!piada" ->
        piada = ApiJoke.piada_aleatoria()
        Api.create_message(msg.channel_id, "😂 Piada: " <> piada)

      String.starts_with?(content, "!nba ") ->
        query = String.trim_leading(content, "!nba ") |> String.trim()
        resposta = NbaAPI.buscar_time(query)
        Api.create_message(msg.channel_id, resposta)

      content == "!jogoshoje" ->
        resposta = FootballApi.get_matches()
        Api.create_message(msg.channel_id, resposta)

      content == "!jogosgratis" ->
        resposta = FreeToGame.buscar_jogos_pc_aleatorios()
        Api.create_message(msg.channel_id, resposta)

      true ->
        :ignore
    end
  end
end
