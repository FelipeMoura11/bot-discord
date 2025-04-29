defmodule BotDiscord.Command.ApiDog do
  @moduledoc """
  Gera uma imagem aleatória da API https://http.dog com base em status codes HTTP.
  """

  @valid_status_codes [
    100, 101, 102, 200, 201, 202, 204, 206, 207, 300, 301, 302, 303, 304, 305, 307,
    400, 401, 402, 403, 404, 405, 406, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418,
    422, 423, 424, 425, 426, 429, 431, 444, 450, 451, 497, 498, 499,
    500, 501, 502, 503, 504, 506, 507, 508, 509, 510, 511, 599, 999
  ]

  @doc """
  Retorna uma URL aleatória da API com base em um status code válido.
  """
  def imagem_aleatoria do
    code = Enum.random(@valid_status_codes)
    "https://http.dog/#{code}.jpg"
  end
end
