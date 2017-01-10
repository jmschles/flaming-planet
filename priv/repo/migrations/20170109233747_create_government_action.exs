defmodule FlamingPlanet.Repo.Migrations.CreateGovernmentAction do
  use Ecto.Migration

  def change do
    create table(:government_actions) do
      add :title, :string
      add :info_link, :string
      add :description, :string

      timestamps()
    end

  end
end
