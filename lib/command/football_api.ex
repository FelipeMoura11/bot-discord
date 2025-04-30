defmodule BotDiscord.Command.FootballApi do
  @moduledoc false

  @api_url "https://api.football-data.org/v4/matches"
  @api_token "bb630269dd40434f970667951964ff56"

  @headers [
    {"X-Auth-Token", @api_token},
    {"Accept", "application/json"}
  ]

  def get_matches do
    case Req.get(@api_url, headers: @headers) do
      {:ok, %Req.Response{status: 200, body: %{"matches" => matches}}} ->
        format_matches(matches)

      {:ok, %Req.Response{status: code}} ->
        "⚠️ Erro ao buscar jogos: status #{code}."

      {:error, reason} ->
        "⚠️ Erro na requisição: #{inspect(reason)}"
    end
  end

  defp format_matches([]), do: "⚽ Nenhum jogo agendado para hoje."

  defp format_matches(matches) do
    Enum.map(matches, fn match ->
      utc_datetime = match["utcDate"]

      {:ok, datetime, _} = DateTime.from_iso8601(utc_datetime)
      datetime_brt = Timex.Timezone.convert(datetime, "America/Sao_Paulo")

      formatted =
        "#{pad(datetime_brt.day)}/#{pad(datetime_brt.month)}/#{datetime_brt.year} às #{pad(datetime_brt.hour)}:#{pad(datetime_brt.minute)}"

      """
      🏟️ #{match["homeTeam"]["name"]} vs #{match["awayTeam"]["name"]}
      📅 #{formatted} 🇧🇷
      🏆 #{match["competition"]["name"]}
      """
    end)
    |> Enum.join("\n\n")
  end

  defp pad(value) when value < 10, do: "0#{value}"
  defp pad(value), do: "#{value}"
end
