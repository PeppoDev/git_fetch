defmodule GitFetch.Repo do
  use Ecto.Repo,
    otp_app: :git_fetch,
    adapter: Ecto.Adapters.Postgres
end
