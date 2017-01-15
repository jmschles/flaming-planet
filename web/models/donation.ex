defmodule FlamingPlanet.Donation do
  use FlamingPlanet.Web, :model

  schema "donations" do
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
    |> validate_length(:description, max: 255)
  end
end
