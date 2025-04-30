defmodule BotDiscord.Command.FreeToGame do
  @moduledoc false

  @base_url "https://www.freetogame.com/api/games"

  def buscar_jogos_pc_aleatorios(qtd \\ 5) do
    case Req.get("#{@base_url}?platform=pc") do
      {:ok, %Req.Response{status: 200, body: jogos}} when is_list(jogos) ->
        jogos
        |> Enum.shuffle()
        |> Enum.take(qtd)
        |> formatar_jogos()

      {:ok, %Req.Response{status: status}} ->
        "⚠️ Erro ao buscar jogos: status #{status}."

      {:error, reason} ->
        "⚠️ Erro na requisição: #{inspect(reason)}"
    end
  end

  defp formatar_jogos(jogos) do
    Enum.map(jogos, fn jogo ->
      """
      🎮 #{jogo["title"]}
      💻 Plataforma: #{jogo["platform"]}
      📝 Gênero: #{jogo["genre"]}
      🔗 [Jogar agora](#{jogo["game_url"]})
      """
    end)
    |> Enum.join("\n\n")
  end
end
