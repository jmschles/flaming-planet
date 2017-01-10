defmodule FlamingPlanet.GovernmentActionControllerTest do
  use FlamingPlanet.ConnCase

  alias FlamingPlanet.GovernmentAction
  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, government_action_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing government actions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, government_action_path(conn, :new)
    assert html_response(conn, 200) =~ "New government action"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, government_action_path(conn, :create), government_action: @valid_attrs
    assert redirected_to(conn) == government_action_path(conn, :index)
    assert Repo.get_by(GovernmentAction, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, government_action_path(conn, :create), government_action: @invalid_attrs
    assert html_response(conn, 200) =~ "New government action"
  end

  test "shows chosen resource", %{conn: conn} do
    government_action = Repo.insert! %GovernmentAction{}
    conn = get conn, government_action_path(conn, :show, government_action)
    assert html_response(conn, 200) =~ "Show government action"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, government_action_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    government_action = Repo.insert! %GovernmentAction{}
    conn = get conn, government_action_path(conn, :edit, government_action)
    assert html_response(conn, 200) =~ "Edit government action"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    government_action = Repo.insert! %GovernmentAction{}
    conn = put conn, government_action_path(conn, :update, government_action), government_action: @valid_attrs
    assert redirected_to(conn) == government_action_path(conn, :show, government_action)
    assert Repo.get_by(GovernmentAction, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    government_action = Repo.insert! %GovernmentAction{}
    conn = put conn, government_action_path(conn, :update, government_action), government_action: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit government action"
  end

  test "deletes chosen resource", %{conn: conn} do
    government_action = Repo.insert! %GovernmentAction{}
    conn = delete conn, government_action_path(conn, :delete, government_action)
    assert redirected_to(conn) == government_action_path(conn, :index)
    refute Repo.get(GovernmentAction, government_action.id)
  end
end
