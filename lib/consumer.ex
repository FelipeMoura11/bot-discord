defmodule BotDiscord.Consumer do
  use Nostrum.Consumer
  alias Nostrum.Api
  alias BotDiscord.Apis.{PiadaApi, ClimaApi}

  def start_link(_args) do
    # Garante que o consumer está sendo supervisionado corretamente
    Nostrum.Consumer.start_link(__MODULE__, %{})
  end

  def handle_event({:MESSAGE_CREATE, %{content: content, author: %{bot: false}, channel_id: channel_id}}) do
    case content do
      "!piada" ->
        resposta = PiadaApi.contar_piada()
        Api.create_message(channel_id, resposta)

      "!clima " <> cidade ->
        resposta = ClimaApi.buscar_clima(cidade)
        Api.create_message(channel_id, resposta)

      _ ->
        :ignore
    end
  end

  def handle_event(_), do: :noop
end
