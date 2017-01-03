defmodule FlamingPlanet.Repo.Migrations.CreateInspiration do
  use Ecto.Migration

  def change do
    create table(:inspirations) do
      add :title, :string
      add :info_link, :string
      add :description, :string

      timestamps()
    end

  end
end
