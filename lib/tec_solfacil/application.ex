defmodule TecSolfacil.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TecSolfacil.Repo,
      # Start the Telemetry supervisor
      TecSolfacilWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TecSolfacil.PubSub},
      # Start the Endpoint (http/https)
      TecSolfacilWeb.Endpoint,
      # Start a worker by calling: TecSolfacil.Worker.start_link(arg)
      # {TecSolfacil.Worker, arg}
      # Start Oban
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TecSolfacil.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TecSolfacilWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:tec_solfacil, Oban)
  end
end
