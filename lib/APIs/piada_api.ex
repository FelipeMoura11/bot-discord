defmodule BotDiscord.Apis.PiadaApi do
  def contar_piada do
    url = "https://v2.jokeapi.dev/joke/Any?lang=pt&format=json"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        case Jason.decode(body) do
          {:ok, json} ->
            if json["type"] == "single" do
              json["joke"]
            else
              "#{json["setup"]} — #{json["delivery"]}"
            end

          {:error, _} ->
            "Erro ao decodificar a resposta da piada."
        end

      _ ->
        "Erro ao acessar a API da piada."
    end
  end
end
