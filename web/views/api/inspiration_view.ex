defmodule FlamingPlanet.Api.InspirationView do
  use FlamingPlanet.Web, :view

  def render("index.json", %{inspirations: inspirations}) do
    %{data: render_many(inspirations, FlamingPlanet.Api.InspirationView, "inspiration.json")}
  end

  def render("inspiration.json", %{inspiration: inspiration}) do
    %{
      id: inspiration.id,
      title: inspiration.title,
      info_link: inspiration.info_link,
      description: inspiration.description
    }
  end
end
