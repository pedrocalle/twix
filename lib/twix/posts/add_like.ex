defmodule Twix.Posts.AddLike do
  alias Twix.Repo
  alias Twix.Posts.Post

  alias Ecto.Changeset

  def call(id) do
    case Repo.get(Post, id) do
      nil -> {:error, :not_found}
      post -> add_likes(post)
    end
  end

  def add_likes(post) do
    likes = post.likes + 1
    post = Changeset.change(post, likes: likes)

    Repo.update(post)
  end
end
