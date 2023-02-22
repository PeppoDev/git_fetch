defmodule GitFetch.GitRepo.Find do
  alias GitFetch.Github.Client

  def by_username(username) do
    # get repo infos from github api
    # return repo infos mapped

    case Client.get_repo_info(username) do
      {:error, _reason} = error ->
        error

      {:ok, body} ->
        response =
          body
          |> Enum.map(&parse_repo_info/1)

        {:ok, response}
    end
  end

  defp parse_repo_info(%{
         "id" => id,
         "name" => name,
         "description" => description,
         "html_url" => html_url,
         "stargazers_count" => stargazers_count
       }) do
    %{
      id: id,
      name: name,
      description: description,
      url: html_url,
      start_count: stargazers_count
    }
  end
end
