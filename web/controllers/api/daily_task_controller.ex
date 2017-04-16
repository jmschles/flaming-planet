defmodule FlamingPlanet.Api.DailyTaskController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    daily_tasks = from(d in DailyTask, order_by: [desc: d.inserted_at]) |> Repo.all
    render(conn, "index.json", daily_tasks: daily_tasks)
  end
end
