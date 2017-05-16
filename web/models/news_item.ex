defmodule FlamingPlanet.NewsItem do
  use FlamingPlanet.Web, :model

  schema "news_items" do
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
    |> validate_length(:title, max: 255)
    |> validate_length(:info_link, max: 255)
    |> validate_length(:description, max: 255)
  end
end
