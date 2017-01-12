defmodule FlamingPlanet.Api.GovernmentActionView do
  use FlamingPlanet.Web, :view

  def render("index.json", %{government_actions: government_actions}) do
    %{data: render_many(government_actions, FlamingPlanet.Api.GovernmentActionView, "government_action.json")}
  end

  def render("government_action.json", %{government_action: government_action}) do
    %{
      id: government_action.id,
      title: government_action.title,
      info_link: government_action.info_link,
      description: government_action.description
    }
  end
end
