defmodule BotDiscord.Apis.ClimaApi do
  @api_key "b2638b0ff1e0764a1278c385882ccf0c"

  def buscar_clima(cidade) do
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(cidade)}&appid=#{@api_key}&lang=pt_br&units=metric"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, json} = Jason.decode(body)
        temp = json["main"]["temp"]
        desc = Enum.at(json["weather"], 0)["description"]
        "O clima em #{cidade} está: #{desc}, com #{temp}°C"

      _ ->
        "Não consegui buscar o clima de #{cidade} agora 🌥️"
    end
  end
end
