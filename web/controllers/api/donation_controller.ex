defmodule FlamingPlanet.Api.DonationController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.Donation

  def index(conn, _params) do
    donations = from(d in Donation, order_by: [desc: d.inserted_at]) |> Repo.all
    render(conn, "index.json", donations: donations)
  end
end
