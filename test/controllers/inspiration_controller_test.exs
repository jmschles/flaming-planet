defmodule FlamingPlanet.InspirationControllerTest do
  use FlamingPlanet.ConnCase

  alias FlamingPlanet.Inspiration
  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, inspiration_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing inspirations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, inspiration_path(conn, :new)
    assert html_response(conn, 200) =~ "New inspiration"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, inspiration_path(conn, :create), inspiration: @valid_attrs
    assert redirected_to(conn) == inspiration_path(conn, :index)
    assert Repo.get_by(Inspiration, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, inspiration_path(conn, :create), inspiration: @invalid_attrs
    assert html_response(conn, 200) =~ "New inspiration"
  end

  test "shows chosen resource", %{conn: conn} do
    inspiration = Repo.insert! %Inspiration{}
    conn = get conn, inspiration_path(conn, :show, inspiration)
    assert html_response(conn, 200) =~ "Show inspiration"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, inspiration_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    inspiration = Repo.insert! %Inspiration{}
    conn = get conn, inspiration_path(conn, :edit, inspiration)
    assert html_response(conn, 200) =~ "Edit inspiration"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    inspiration = Repo.insert! %Inspiration{}
    conn = put conn, inspiration_path(conn, :update, inspiration), inspiration: @valid_attrs
    assert redirected_to(conn) == inspiration_path(conn, :show, inspiration)
    assert Repo.get_by(Inspiration, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    inspiration = Repo.insert! %Inspiration{}
    conn = put conn, inspiration_path(conn, :update, inspiration), inspiration: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit inspiration"
  end

  test "deletes chosen resource", %{conn: conn} do
    inspiration = Repo.insert! %Inspiration{}
    conn = delete conn, inspiration_path(conn, :delete, inspiration)
    assert redirected_to(conn) == inspiration_path(conn, :index)
    refute Repo.get(Inspiration, inspiration.id)
  end
end
