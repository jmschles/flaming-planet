defmodule FlamingPlanet.PageController do
  use FlamingPlanet.Web, :controller

  def index(conn, _params) do
    redirect conn, to: api_daily_task_path(conn, :index)
  end
end
