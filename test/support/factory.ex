defmodule Rockelivery.Factory do
  use ExMachina

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
end
