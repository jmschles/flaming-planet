defmodule FlamingPlanet.Api.InspirationController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.Inspiration

  def index(conn, _params) do
    inspirations = from(i in Inspiration, order_by: [desc: i.inserted_at]) |> Repo.all
    render(conn, "index.json", inspirations: inspirations)
  end
end
