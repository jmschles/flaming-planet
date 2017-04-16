defmodule FlamingPlanet.Api.GovernmentActionController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.GovernmentAction

  def index(conn, _params) do
    government_actions = from(g in GovernmentAction, order_by: [desc: g.inserted_at]) |> Repo.all
    render(conn, "index.json", government_actions: government_actions)
  end
end
