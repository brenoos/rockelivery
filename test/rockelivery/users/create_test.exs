defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, asyn: true

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 27, email: "Sincere_Schmidt@gmail.com"}} = response
    end

    test "when there are invalid params, returns an error" do
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

      response = Create.call(params)

      expected_response = %{
        address: ["can't be blank"],
        age: ["must be greater than or equal to 18"],
        cep: ["should be 8 character(s)"],
        cpf: ["should be 11 character(s)"],
        email: ["has invalid format"],
        name: ["can't be blank"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
