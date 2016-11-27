defmodule FlamingPlanet.Repo.Migrations.CreateDailyTask do
  use Ecto.Migration

  def change do
    create table(:daily_tasks) do
      add :title, :string, null: false
      add :description, :string
      add :image_url, :string
      timestamps
    end
  end
end
