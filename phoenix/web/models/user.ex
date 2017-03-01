defmodule Nativo.User do
  use Nativo.Web, :model
  alias Nativo.User

  schema "users" do
    field :user_name, :string
    field :token, :string
    field :email, :string
    field :name, :string
    field :progress, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_name, :token, :email, :name, :progress])
    |> validate_required([:user_name, :token, :email, :name])
  end

end
