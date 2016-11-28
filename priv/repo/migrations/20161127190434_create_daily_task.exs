defmodule FlamingPlanet.Repo.Migrations.CreateDailyTask do
  use Ecto.Migration

  def change do
    create table(:daily_tasks) do
      add :title, :string, null: false
      add :info_link, :string, null: false
      add :description, :string
      timestamps
    end
  end
end
