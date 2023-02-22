defmodule GitFetchWeb.GitRepoController do
  use GitFetchWeb, :controller

  def show(conn, %{"username" => username}) do
    case GitFetch.find_repos(username) do
      {:ok, response} ->
        conn
        |> put_status(200)
        |> render("index.json", repos: response)

      {:error, _reason} ->
        conn
        |> put_status(400)
        |> text("WelcomeErr!")
    end

    conn
    |> put_status(200)
  end
end
