defmodule Twix.Users.Get do
  alias Twix.Users.User
  alias Twix.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}
      user ->
        {:ok, Repo.preload(user, followers: [:follower], following: [:following])}
    end
  end
end
