defmodule Twix.Users.Update do
  alias Twix.Users.User
  alias Twix.Repo


  def call(%{id: id} = params) do
    case Repo.get(User, id) do
      nil -> {:user, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
