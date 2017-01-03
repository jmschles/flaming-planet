defmodule FlamingPlanet.InspirationTest do
  use FlamingPlanet.ModelCase

  alias FlamingPlanet.Inspiration

  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Inspiration.changeset(%Inspiration{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Inspiration.changeset(%Inspiration{}, @invalid_attrs)
    refute changeset.valid?
  end
end
