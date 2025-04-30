defmodule BotDiscord.Command.NbaAPI do
  @moduledoc false

  @api_key "5ba2a081-b456-41bd-a541-603ba879ad52"
  @base_url "https://api.balldontlie.io/v1"

  def get_teams do
    Req.get!(
      url: "#{@base_url}/teams",
      headers: [{"Authorization", @api_key}]
    )
    |> Map.get(:body)
    |> Map.get("data")
  end

  def find_team_by_name(query) do
    query_down = String.downcase(query)

    get_teams()
    |> Enum.filter(fn team ->
      team["full_name"]
      |> String.downcase()
      |> String.contains?(query_down)
      or
      team["name"]
      |> String.downcase()
      |> String.contains?(query_down)
      or
      team["city"]
      |> String.downcase()
      |> String.contains?(query_down)
    end)
  end

  def buscar_time(query) do
    case find_team_by_name(query) do
      [] ->
        "🏀 Nenhum time encontrado com o nome \"#{query}\"."

      [team] ->
        """
        🏀 Time encontrado:
        Nome completo: #{team["full_name"]}
        Cidade: #{team["city"]}
        Conferência: #{team["conference"]}
        Divisão: #{team["division"]}
        Sigla: #{team["abbreviation"]}
        """

      teams ->
        "🏀 Vários times encontrados:\n" <>
          Enum.map_join(teams, "\n", fn t ->
            "- #{t["full_name"]} (#{t["abbreviation"]})"
          end)
    end
  end
end
