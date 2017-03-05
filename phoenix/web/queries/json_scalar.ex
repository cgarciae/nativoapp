defmodule Nativo.Schema.Json do
  use Absinthe.Schema.Notation

  scalar :json do
    parse &Poison.decode(&1.value)
    serialize &Poison.encode!/1
  end
end