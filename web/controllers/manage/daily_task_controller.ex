defmodule FlamingPlanet.Manage.DailyTaskController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin

  alias FlamingPlanet.DailyTask

  def index(conn, _params) do
    daily_tasks = Repo.all(DailyTask)
    render conn, "index.html", daily_tasks: daily_tasks
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
        |> redirect(to: manage_daily_task_path(conn, :index))
      { :error, changeset } ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{ "id" => id }) do
    daily_task = Repo.get(DailyTask, id)
    Repo.delete!(daily_task)

    conn
    |> put_flash(:info, "Daily task deleted")
    |> redirect(to: manage_daily_task_path(conn, :index))
  end

  def edit(conn, %{ "id" => id }) do
    daily_task = Repo.get(DailyTask, id)
    changeset = DailyTask.changeset(daily_task)
    render(conn, "edit.html", daily_task: daily_task, changeset: changeset)
  end

  def update(conn, %{ "id" => id, "daily_task" => daily_task_params }) do
    daily_task = Repo.get(DailyTask, id)
    changeset = DailyTask.changeset(daily_task, daily_task_params)

    case Repo.update(changeset) do
      { :ok, _daily_task } ->
        conn
        |> put_flash(:info, "Daily task updated!")
        |> redirect(to: manage_daily_task_path(conn, :index))
      { :error, changeset } ->
        render(conn, "edit.html", changeset: changeset)
    end
  end
end
