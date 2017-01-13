defmodule FlamingPlanet.Api.NewsItemView do
  use FlamingPlanet.Web, :view

  def render("index.json", %{news_items: news_items}) do
    %{data: render_many(news_items, FlamingPlanet.Api.NewsItemView, "news_item.json")}
  end

  def render("news_item.json", %{news_item: news_item}) do
    %{
      id: news_item.id,
      title: news_item.title,
      info_link: news_item.info_link,
      description: news_item.description
    }
  end
end
