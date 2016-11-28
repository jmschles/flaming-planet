defmodule FlamingPlanet.DailyTask do
  use FlamingPlanet.Web, :model

  schema "daily_tasks" do
    field :title, :string
    field :info_link, :string
    field :description, :string

    timestamps
  end
end
