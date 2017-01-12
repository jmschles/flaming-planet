defmodule FlamingPlanet.Api.GovernmentActionController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.GovernmentAction

  def index(conn, _params) do
    government_actions = Repo.all(GovernmentAction)
    render(conn, "index.json", government_actions: government_actions)
  end
end
