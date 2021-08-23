defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "61285 Kip Throughway",
      cep: "31943588",
      cpf: "23941239411",
      email: "Sincere_Schmidt@gmail.com",
      password: "KVVPwhzIoDX5DcW",
      name: "Adrian"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "61285 Kip Throughway",
      cep: "31943588",
      cpf: "23941239411",
      email: "Sincere_Schmidt@gmail.com",
      password: "KVVPwhzIoDX5DcW",
      name: "Adrian",
      id: "b675fd8e-0ef8-4c55-9ff7-fd170f2a11e3"
    }
  end
end
