defmodule FlamingPlanet.Api.NewsItemController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.NewsItem

  def index(conn, _params) do
    news_items = Repo.all(NewsItem)
    render(conn, "index.json", news_items: news_items)
  end
end
