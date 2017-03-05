defmodule Nativo.Repo.Migrations.AddInterests do
  use Ecto.Migration

  def change do
    alter table(:users) do
       add :interests, :map
    end
  end
end
