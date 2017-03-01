defmodule Nativo.Repo.Migrations.AddProgress do
  use Ecto.Migration

  def change do
    alter table(:users) do
       add :progress, :map
    end
  end
end
