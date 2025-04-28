defmodule BotDiscord.Video do
  @api_token "MjA5NjE3XzE3NDU4NjkxNTdfNmZhYTE1YzFkZWUzNDJmMjQwNjU5YTE4YmU3MmJjMGQ4MzA3Y2U0YQ=="  # Token da API
  @base_url "https://www.scorebat.com/video-api/v3/feed/?token=[MjA5NjE3XzE3NDU4NjkxNDJfY2RiMGEzMzVlYzI5MmFmZjhhY2NkYTg3YWFkY2M5NzNkMmM3OWU0Nw==]"

  def buscar_videos_do_time(time) do
    url = "#{@base_url}?token=#{@api_token}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, json} = Jason.decode(body)

        case Map.fetch(json, "response") do
          {:ok, videos} ->
            videos_do_time = Enum.filter(videos, fn video ->
              String.contains?(String.downcase(video["title"]), String.downcase(time))
            end)

            if length(videos_do_time) > 0 do
              video_info = Enum.at(videos_do_time, 0)
              title = video_info["title"]
              embed_url = video_info["embed"]

              "Vídeo do time #{time}: #{title}. Você pode assistir [aqui](#{embed_url})"
            else
              "Não encontrei vídeos recentes do time #{time}."
            end

          :error ->
            "Não foi possível encontrar vídeos para o time #{time}."
        end

      {:error, %HTTPoison.Error{reason: reason}} ->
        "Erro ao conectar com a API: #{inspect(reason)}"  # Captura o erro da API corretamente
    end
  end
end
