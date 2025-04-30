defmodule BotDiscord.Command.ApiJoke do
  def piada_aleatoria do
    url = "https://official-joke-api.appspot.com/random_joke"

    case Req.get(url) do
      {:ok, %Req.Response{status: 200, body: %{"setup" => setup, "punchline" => punchline}}} ->
        "#{setup} - #{punchline}"

      _ ->
        "Desculpe, não consegui encontrar uma piada agora. 😢"
    end
  end
end
