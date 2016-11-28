defmodule FlamingPlanet.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string, null: false
      add :password_hash, :string

      timestamps
    end

    create unique_index(:admins, [:username])
  end
end
