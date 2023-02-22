defmodule GitFetch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GitFetch.Repo,
      # Start the Telemetry supervisor
      GitFetchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GitFetch.PubSub},
      # Start the Endpoint (http/https)
      GitFetchWeb.Endpoint
      # Start a worker by calling: GitFetch.Worker.start_link(arg)
      # {GitFetch.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GitFetch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GitFetchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
