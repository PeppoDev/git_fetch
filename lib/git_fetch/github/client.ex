defmodule GitFetch.Github.Client do
  use Tesla

  alias Tesla.Env

  plug(Tesla.Middleware.JSON)

  plug(Tesla.Middleware.Headers, [
    {"User-Agent", "GitFetchApp"}
  ])

  @base_url "https://api.github.com/users"

  def get_repo_info(username) do
    "#{@base_url}/#{username}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:error, reason}) do
    {:error, reason}
  end
end
