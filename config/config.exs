# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :git_fetch,
  ecto_repos: [GitFetch.Repo]

# Configures the endpoint
config :git_fetch, GitFetchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7xr75nGa7hFZ1ZGO07shiKTETCiEqgckf7bG+UfjuyqFkL2jTwiYxOtTayzx2IoB",
  render_errors: [view: GitFetchWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GitFetch.PubSub,
  live_view: [signing_salt: "9/4UZuIn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
