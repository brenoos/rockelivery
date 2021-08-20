defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  alias Rockelivery.User
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def index(connection, _params) do
    with [%User{} | _rest] = users_list <- Rockelivery.get_all_users() do
      connection
      |> put_status(:ok)
      |> render("index.json", users_list: users_list)
    end
  end

  def create(connection, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %User{}} <- Rockelivery.delete_user(id) do
      connection
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rockelivery.get_user_by_id(id) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def update(connection, params) do
    with {:ok, %User{} = user} <- Rockelivery.update_user(params) do
      connection
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
