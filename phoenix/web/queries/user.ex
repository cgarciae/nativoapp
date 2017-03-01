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
    field :progress, :string
  end


  def all(_, _) do
    {:ok,
      Repo.all(User)
      |> Enum.map(&encode_map_args/1)
    }
  end

  def create(args, _info) do
    user = Repo.get_by(User, email: args.email)

    if user do
      user = encode_map_args(user)
      {:ok, user}
    else
      args = decode_map_args(args)

      {:ok, user } =
        %User{}
        |> User.changeset(args)
        |> Repo.insert

      user = encode_map_args(user)
      {:ok, user}
    end
  end

  def get(%{id: id} = args, _info) do
    case Repo.get(User, id) do
      %User{} = user ->
        user = encode_map_args(user)
        {:ok, user}

      _ ->
        {:error, "Not found"}
    end
  end

  def update(%{id: id} = args, _info) do
    case Repo.get(User, id) do
      user = %User{} ->
        args = decode_map_args(args)

        IO.inspect "\n\n"
        IO.inspect args

        {:ok, user } =
          user
          |> User.changeset(args)
          |> Repo.update

        IO.inspect user

        user = encode_map_args(user)

        IO.inspect user

        {:ok, user}
      nil ->
        {:error, "Not Found"}
    end
  end

  defp decode_map_args(args) do
      args = maybe_update(args, :progress, &Poison.decode!/1)
      args = maybe_update(args, :interests, &Poison.decode!/1)
  end

  defp encode_map_args(args) do
      args = maybe_update(args, :progress, &Poison.encode!/1)
      args = maybe_update(args, :interests, &Poison.encode!/1)
  end

  defp maybe_update(map, key, fun) do
    if Map.has_key?(map, key) do
      Map.update!(map, key, fun)
    else
      map
    end
  end
end