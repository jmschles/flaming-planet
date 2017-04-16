defmodule FlamingPlanet.Api.NewsItemController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.NewsItem

  def index(conn, _params) do
    news_items = from(n in NewsItem, order_by: [desc: n.inserted_at]) |> Repo.all
    render(conn, "index.json", news_items: news_items)
  end
end
