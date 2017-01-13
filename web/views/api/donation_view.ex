defmodule FlamingPlanet.Api.DonationView do
  use FlamingPlanet.Web, :view

  def render("index.json", %{donations: donations}) do
    %{data: render_many(donations, FlamingPlanet.Api.DonationView, "donation.json")}
  end

  def render("donation.json", %{donation: donation}) do
    %{
      id: donation.id,
      title: donation.title,
      info_link: donation.info_link,
      description: donation.description
    }
  end
end
