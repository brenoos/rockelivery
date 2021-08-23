defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert response == %{
             message: "User Created!",
             user: %Rockelivery.User{
               address: "61285 Kip Throughway",
               age: 27,
               cep: "31943588",
               cpf: "23941239411",
               email: "Sincere_Schmidt@gmail.com",
               id: "b675fd8e-0ef8-4c55-9ff7-fd170f2a11e3",
               inserted_at: nil,
               name: "Adrian",
               password: "KVVPwhzIoDX5DcW",
               password_hash: nil,
               updated_at: nil
             }
           }
  end
end
