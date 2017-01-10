defmodule FlamingPlanet.Repo.Migrations.CreateNewsItem do
  use Ecto.Migration

  def change do
    create table(:news_item) do
      add :title, :string
      add :info_link, :string
      add :description, :string

      timestamps()
    end

  end
end
