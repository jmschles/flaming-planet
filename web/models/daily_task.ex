defmodule FlamingPlanet.DailyTask do
  use FlamingPlanet.Web, :model

  schema "daily_tasks" do
    field :title, :string
    field :info_link, :string
    field :description, :string

    timestamps
  end

  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, ~w(title info_link description), [])
  end
end
