defmodule FlamingPlanet.DailyTask do
  use FlamingPlanet.Web, :model

  schema "daily_tasks" do
    field :title, :string
    field :description, :string
    field :image_url, :string

    timestamps
  end
end
