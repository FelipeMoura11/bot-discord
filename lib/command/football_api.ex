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
        today = Timex.now("America/Sao_Paulo") |> DateTime.to_date()

        matches_today =
          matches
          |> Enum.filter(fn match ->
            case DateTime.from_iso8601(match["utcDate"]) do
              {:ok, datetime, _} ->
                datetime_brt = Timex.Timezone.convert(datetime, "America/Sao_Paulo")
                Date.compare(DateTime.to_date(datetime_brt), today) == :eq

              _ -> false
            end
          end)

        format_matches(matches_today)

      {:ok, %Req.Response{status: code}} ->
        "⚠️ Erro ao buscar jogos: status #{code}."

      {:error, reason} ->
        "⚠️ Erro na requisição: #{inspect(reason)}"
    end
  end


  defp format_matches([]), do: "⚽ Nenhum jogo agendado para hoje."

  defp format_matches(matches) do
    Enum.map(matches, fn match ->
      {:ok, datetime, _} = DateTime.from_iso8601(match["utcDate"])
      datetime_brt = Timex.Timezone.convert(datetime, "America/Sao_Paulo")

      date_str = "#{pad(datetime_brt.day)}/#{pad(datetime_brt.month)}/#{Integer.to_string(datetime_brt.year) |> String.slice(2..3)}"
      time_str = "#{pad(datetime_brt.hour)}h"

      "#{match["homeTeam"]["name"]} vs #{match["awayTeam"]["name"]} - #{date_str} às #{time_str}"
    end)
    |> Enum.join("\n")
  end

  defp pad(value) when value < 10, do: "0#{value}"
  defp pad(value), do: "#{value}"
end
