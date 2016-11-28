defmodule FlamingPlanet.DailyTaskController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    id = Repo.one(from d in DailyTask, order_by: [asc: d.id], limit: 1).id
    redirect(conn, to: "/daily_tasks/#{ id }")
  end

  def show(conn, %{ "id" => id }) do
    daily_task = Repo.get(DailyTask, id)
    render conn, "show.html", daily_task: daily_task
  end
end
