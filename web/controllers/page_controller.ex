defmodule FlamingPlanet.PageController do
  use FlamingPlanet.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
