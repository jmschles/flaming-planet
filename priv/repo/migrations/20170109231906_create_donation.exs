defmodule FlamingPlanet.Repo.Migrations.CreateDonation do
  use Ecto.Migration

  def change do
    create table(:donations) do
      add :title, :string
      add :info_link, :string
      add :description, :string

      timestamps()
    end

  end
end
