defmodule FlamingPlanet.DailyTaskController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin when action in [:new, :create]

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    id = Repo.one(from d in DailyTask, order_by: [asc: d.id], limit: 1).id
    redirect(conn, to: "/daily_tasks/#{ id }")
  end

  def show(conn, %{ "id" => id }) do
    daily_task = Repo.get(DailyTask, id)
    render conn, "show.html", daily_task: daily_task
  end

  def new(conn, _params) do
    changeset = DailyTask.changeset(%DailyTask{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{ "daily_task" => daily_task_params }) do
    changeset = DailyTask.changeset(%DailyTask{}, daily_task_params)
    case Repo.insert(changeset) do
      { :ok, _daily_task } ->
        conn
        |> put_flash(:info, "New daily task created!")
        |> redirect(to: admin_path(conn, :show))
      { :error, changeset } ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
