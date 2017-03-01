defmodule Nativo.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_name, :string
      add :token, :string
      add :email, :string
      add :name, :string

      timestamps()
    end
  end
end
