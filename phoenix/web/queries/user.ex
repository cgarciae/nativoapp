defmodule Nativo.Schema.User do
  use Absinthe.Schema.Notation
  use Nativo.Web, :resolver

  alias Nativo.User

  object :user do
    field :id, :id
    field :user_name, :string
    field :token, :string
    field :email, :string
    field :name, :string
    field :progress, :json
    field :interests, :json
  end


  def all(_, _) do
    {:ok,
      Repo.all(User)
    }
  end

  def create(args, _info) do
    user = Repo.get_by(User, email: args.email)

    if user do
      {:ok, user}
    else
        %User{}
        |> User.changeset(args)
        |> Repo.insert
    end
  end

  def get(%{id: id} = args, _info) do
    case Repo.get(User, id) do
      %User{} = user ->
        {:ok, user}

      _ ->
        {:error, "Not found"}
    end
  end

  def update(%{id: id} = args, _info) do
    case Repo.get(User, id) do
      user = %User{} ->
          user
          |> User.changeset(args)
          |> Repo.update
      nil ->
        {:error, "Not Found"}
    end
  end


end