defmodule FlamingPlanet.Api.InspirationController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.Inspiration

  def index(conn, _params) do
    inspirations = Repo.all(Inspiration)
    render(conn, "index.json", inspirations: inspirations)
  end
end
