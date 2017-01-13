defmodule FlamingPlanet.PageController do
  use FlamingPlanet.Web, :controller
  plug :put_layout, "main.html"

  def index(conn, _params) do
    render conn, "index.html"
  end
end
