defmodule Twix.Users.Delete do
  alias Twix.Users.User
  alias Twix.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
