defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("index.json", %{users_list: [%User{} | _rest] = users_list}), do: users_list

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User Created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
