defmodule FlamingPlanet.GovernmentActionTest do
  use FlamingPlanet.ModelCase

  alias FlamingPlanet.GovernmentAction

  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GovernmentAction.changeset(%GovernmentAction{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GovernmentAction.changeset(%GovernmentAction{}, @invalid_attrs)
    refute changeset.valid?
  end
end
