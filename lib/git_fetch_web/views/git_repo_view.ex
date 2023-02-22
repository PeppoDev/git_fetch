defmodule GitFetchWeb.GitRepoView do
  use GitFetchWeb, :view

  def render("index.json", %{repos: repos}) do
    %{data: render_many(repos, __MODULE__, "repo.json")}
  end

  def render("repo.json", %{git_repo: repo}) do
    %{
      id: repo.id,
      name: repo.name,
      description: repo.description,
      url: repo.url,
      star_count: repo.star_count
    }
  end
end
