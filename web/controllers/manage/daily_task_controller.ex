defmodule FlamingPlanet.Manage.DailyTaskController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin when action in [:new, :create, :index, :show]

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    daily_tasks = Repo.all(DailyTask)
    render conn, "index.html", daily_tasks: daily_tasks
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

  def delete(conn, %{ "id" => id }) do
    daily_task = Repo.get(DailyTask, id)
    Repo.delete!(daily_task)

    conn
    |> put_flash(:info, "Daily task deleted")
    |> redirect(to: daily_task_path(conn, :index))
  end
end
