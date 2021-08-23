defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "When all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Adrian"}, valid?: true} = response
    end

    test "When updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{name: "new", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "new"}, valid?: true} = response
    end

    test "When there are some error, returns an invalid changeset" do
      params =
        build(:user_params, %{
          age: 15,
          address: "",
          cep: "319435",
          cpf: "239412",
          email: "Sincere_Schmidtgmail.com",
          password: "KVV",
          name: ""
        })

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"],
        address: ["can't be blank"],
        cep: ["should be 8 character(s)"],
        cpf: ["should be 11 character(s)"],
        email: ["has invalid format"],
        name: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
