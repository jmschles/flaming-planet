defmodule FlamingPlanet.DonationTest do
  use FlamingPlanet.ModelCase

  alias FlamingPlanet.Donation

  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Donation.changeset(%Donation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Donation.changeset(%Donation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
