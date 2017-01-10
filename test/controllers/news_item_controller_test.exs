defmodule FlamingPlanet.NewsItemControllerTest do
  use FlamingPlanet.ConnCase

  alias FlamingPlanet.NewsItem
  @valid_attrs %{description: "some content", info_link: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, news_item_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing news item"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, news_item_path(conn, :new)
    assert html_response(conn, 200) =~ "New news item"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @valid_attrs
    assert redirected_to(conn) == news_item_path(conn, :index)
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, news_item_path(conn, :create), news_item: @invalid_attrs
    assert html_response(conn, 200) =~ "New news item"
  end

  test "shows chosen resource", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = get conn, news_item_path(conn, :show, news_item)
    assert html_response(conn, 200) =~ "Show news item"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, news_item_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = get conn, news_item_path(conn, :edit, news_item)
    assert html_response(conn, 200) =~ "Edit news item"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @valid_attrs
    assert redirected_to(conn) == news_item_path(conn, :show, news_item)
    assert Repo.get_by(NewsItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = put conn, news_item_path(conn, :update, news_item), news_item: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit news item"
  end

  test "deletes chosen resource", %{conn: conn} do
    news_item = Repo.insert! %NewsItem{}
    conn = delete conn, news_item_path(conn, :delete, news_item)
    assert redirected_to(conn) == news_item_path(conn, :index)
    refute Repo.get(NewsItem, news_item.id)
  end
end
