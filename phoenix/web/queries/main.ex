defmodule Nativo.Schema do
  use Absinthe.Schema
  alias Nativo.Schema

  import_types Schema.User
  import_types Schema.Json


  query do
    field :hello, :string do
      resolve fn(_, _) -> {:ok, "world"} end
    end

    field :users, list_of(:user) do
      resolve &Schema.User.all/2
    end

    field :get_user, :user do
      arg :id, non_null(:id)

      resolve &Schema.User.get/2
    end

  end

  mutation do

    field :create_user, :user do
      arg :user_name, non_null(:string)
      arg :token, non_null(:string)
      arg :email, non_null(:string)
      arg :name, non_null(:string)

      resolve &Schema.User.create/2
    end

    field :update_user, :user do
      arg :id, non_null(:id)
      arg :user_name, :string
      arg :token, :string
      arg :email, :string
      arg :name, :string
      arg :progress, :json
      arg :interests, :json

      resolve &Schema.User.update/2
    end

  end #mutation
end #module