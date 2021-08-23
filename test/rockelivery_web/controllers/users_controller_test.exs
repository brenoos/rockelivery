defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "When all params are valid, creates the user", %{conn: connection} do
      params = %{
        "age" => 27,
        "address" => "61285 Kip Throughway",
        "cep" => "31943588",
        "cpf" => "23941239411",
        "email" => "Sincere_Schmidt@gmail.com",
        "password" => "KVVPwhzIoDX5DcW",
        "name" => "Adrian"
      }

      response =
        connection
        |> post(Routes.users_path(connection, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User Created!",
               "user" => %{
                 "address" => "61285 Kip Throughway",
                 "age" => 27,
                 "cpf" => "23941239411",
                 "email" => "Sincere_Schmidt@gmail.com",
                 "id" => _uuid
               }
             } = response
    end

    test "When there are some error, returns the error", %{conn: connection} do
      params = %{
        "password" => "123456",
        "name" => "Teste"
      }

      response =
        connection
        |> post(Routes.users_path(connection, :create, params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "address" => ["can't be blank"],
                 "age" => ["can't be blank"],
                 "cep" => ["can't be blank"],
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    test "When there is a user with the given id, deletes the user", %{conn: connection} do
      id = "b675fd8e-0ef8-4c55-9ff7-fd170f2a11e3"
      insert(:user)

      response =
        connection
        |> delete(Routes.users_path(connection, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
