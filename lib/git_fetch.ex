defmodule GitFetch do
  alias GitFetch.GitRepo.Find, as: FindRepos

  defdelegate find_repos(params), to: FindRepos, as: :by_username
end
