defmodule BotDiscord.CommandHandler do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias BotDiscord.Apis.{PiadaApi, ClimaApi}

  def handle_event({:MESSAGE_CREATE, %{content: content, author: %{bot: false}, channel_id: channel_id}}) do
    case content do
      "!piada" ->
        resposta = PiadaApi.contar_piada()
        Api.create_message(channel_id, resposta)

      "!clima " <> cidade ->
        resposta = ClimaApi.buscar_clima(cidade)
        Api.create_message(channel_id, resposta)

      _ -> :ignore
    end
  end

  def handle_event(_), do: :noop
end
