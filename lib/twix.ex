defmodule Twix do
  alias Twix.Users
  alias Twix.Posts

  defdelegate create_post(params), to: Posts.Create, as: :call
  defdelegate add_like_to_post(id), to: Posts.AddLike, as: :call
  defdelegate get_user_posts(user, page, per_page), to: Posts.Get, as: :call

  defdelegate create_user(params), to: Users.Create, as: :call
  defdelegate get_user(id), to: Users.Get, as: :call
  defdelegate update_user(params), to: Users.Update, as: :call
  defdelegate delete_user(id), to: Users.Delete, as: :call
  defdelegate add_follower(user_id, follower_id), to: Users.Follow, as: :call
end
