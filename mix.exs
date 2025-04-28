defmodule BotDiscord.MixProject do
  use Mix.Project

  def project do
    [
      app: :testebot,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:nostrum, "~> 0.10"},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"}
    ]
  end
end
