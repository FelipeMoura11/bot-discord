defmodule BotDiscord do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias BotDiscord.Video  # Importando o módulo para vídeos

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg, label: "Mensagem recebida")  # Adicionando log para inspecionar msg

    case String.split(msg.content, " ", parts: 2) do
      ["!ping"] ->
        # Verificando se existe channel_id
        channel_id = Map.get(msg, :channel_id, nil)
        if channel_id do
          Api.Message.create(channel_id, "Pong!")
        else
          IO.puts("Erro: channel_id não encontrado")
        end

      ["!video", time] ->
        # Verificando se existe channel_id
        channel_id = Map.get(msg, :channel_id, nil)
        if channel_id do
          case Video.buscar_videos_do_time(time) do
            msg when is_binary(msg) ->
              Api.Message.create(channel_id, msg)

            _ ->
              Api.Message.create(channel_id, "Houve um erro ao buscar vídeos.")
          end
        else
          IO.puts("Erro: channel_id não encontrado para o comando !video")
        end

      _ ->
        :ignore
    end
  end
end
