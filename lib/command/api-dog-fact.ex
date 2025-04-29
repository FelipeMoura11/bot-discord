defmodule BotDiscord.Command.ApiDogFact do
  @api_url "https://dogapi.dog/api/v2/facts?limit=1"

  def fato_aleatorio do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"data" => [%{"attributes" => %{"body" => fato}}]}}} ->
        "🐶 Fato aleatório sobre cachorros:\n#{fato}"

      {:ok, %{status: status}} ->
        "⚠️ Erro ao buscar fato de cachorro. Código HTTP: #{status}"

      {:error, error} ->
        "❌ Erro na requisição: #{inspect(error)}"
    end
  end
end
