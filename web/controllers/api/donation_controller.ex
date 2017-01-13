defmodule FlamingPlanet.Api.DonationController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.Donation

  def index(conn, _params) do
    donations = Repo.all(Donation)
    render(conn, "index.json", donations: donations)
  end
end
