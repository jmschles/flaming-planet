defmodule FlamingPlanet.DailyTaskController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    daily_tasks = Repo.all(DailyTask)
    render conn, "index.html", daily_tasks: daily_tasks
  end
end
