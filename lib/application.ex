defmodule BotDiscord.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: BotDiscord.Worker.start_link(arg)
      # {BotDiscord.Worker, arg}
      BotDiscord
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BotDiscord.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
