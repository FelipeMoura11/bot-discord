defmodule BotDiscord.Command.ApiWeather do
  def clima_resumido do
    url = "https://wttr.in/?format=3"

    case Req.get(url) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        body

      _ ->
        "Não consegui obter o clima agora. 🌧️"
    end
  end
end
