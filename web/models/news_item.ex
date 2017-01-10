defmodule FlamingPlanet.NewsItem do
  use FlamingPlanet.Web, :model

  schema "news_item" do
    field :title, :string
    field :info_link, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :info_link, :description])
    |> validate_required([:title, :info_link, :description])
  end
end
