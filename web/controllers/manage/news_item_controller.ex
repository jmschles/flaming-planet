defmodule FlamingPlanet.Manage.NewsItemController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin

  alias FlamingPlanet.NewsItem

  def index(conn, _params) do
    news_item = Repo.all(NewsItem)
    render(conn, "index.html", news_item: news_item)
  end

  def new(conn, _params) do
    changeset = NewsItem.changeset(%NewsItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"news_item" => news_item_params}) do
    changeset = NewsItem.changeset(%NewsItem{}, news_item_params)

    case Repo.insert(changeset) do
      {:ok, _news_item} ->
        conn
        |> put_flash(:info, "News item created!")
        |> redirect(to: manage_news_item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    news_item = Repo.get!(NewsItem, id)
    changeset = NewsItem.changeset(news_item)
    render(conn, "edit.html", news_item: news_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "news_item" => news_item_params}) do
    news_item = Repo.get!(NewsItem, id)
    changeset = NewsItem.changeset(news_item, news_item_params)

    case Repo.update(changeset) do
      {:ok, _news_item} ->
        conn
        |> put_flash(:info, "News item updated!")
        |> redirect(to: manage_news_item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", news_item: news_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    news_item = Repo.get!(NewsItem, id)
    Repo.delete!(news_item)

    conn
    |> put_flash(:info, "News item deleted.")
    |> redirect(to: manage_news_item_path(conn, :index))
  end
end
