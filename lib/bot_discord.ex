defmodule BotDiscord do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias BotDiscord.Command.ApiCat
  alias BotDiscord.Command.ApiCatFact
  alias BotDiscord.Command.ApiDog
  alias BotDiscord.Command.ApiDogFact


  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg, label: "Mensagem recebida")

    case String.split(msg.content, " ", parts: 2) do
      ["!ping"] ->
        Api.create_message(msg.channel_id, "Pong!")

      ["!gato"] ->
        imagem = ApiCat.imagem_aleatoria()
        Api.create_message(msg.channel_id, imagem)

      ["!gatofato"] ->
      resposta = ApiCatFact.fato_aleatorio()
      Api.create_message(msg.channel_id, "🐱 Fato aleatório: " <> resposta)

      ["!cachorro"] ->
        imagem = ApiDog.imagem_aleatoria()
        Api.create_message(msg.channel_id, imagem)


      ["!dogfact"] ->
        fato = ApiDogFact.fato_aleatorio()
        Api.create_message(msg.channel_id, fato)

      _ ->
        :ignore
    end
  end
end
