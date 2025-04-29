defmodule BotDiscord.Command.ApiCatFact do
  @moduledoc """
  Busca um fato aleatório de gato da API https://meowfacts.herokuapp.com/
  """

  def fato_aleatorio do
    url = "https://meowfacts.herokuapp.com/"

    case Req.get(url) do
      {:ok, %{status: 200, body: %{"data" => [fato | _]}}} ->
        fato

      {:ok, %{status: status}} ->
        "Erro ao buscar fato de gato. Código HTTP: #{status}"

      {:error, error} ->
        "Erro na requisição: #{inspect(error)}"
    end
  end
end
