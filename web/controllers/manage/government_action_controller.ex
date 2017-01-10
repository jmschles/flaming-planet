defmodule FlamingPlanet.Manage.GovernmentActionController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin

  alias FlamingPlanet.GovernmentAction

  def index(conn, _params) do
    government_actions = Repo.all(GovernmentAction)
    render(conn, "index.html", government_actions: government_actions)
  end

  def new(conn, _params) do
    changeset = GovernmentAction.changeset(%GovernmentAction{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"government_action" => government_action_params}) do
    changeset = GovernmentAction.changeset(%GovernmentAction{}, government_action_params)

    case Repo.insert(changeset) do
      {:ok, _government_action} ->
        conn
        |> put_flash(:info, "New government action created!")
        |> redirect(to: government_action_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    government_action = Repo.get!(GovernmentAction, id)
    changeset = GovernmentAction.changeset(government_action)
    render(conn, "edit.html", government_action: government_action, changeset: changeset)
  end

  def update(conn, %{"id" => id, "government_action" => government_action_params}) do
    government_action = Repo.get!(GovernmentAction, id)
    changeset = GovernmentAction.changeset(government_action, government_action_params)

    case Repo.update(changeset) do
      {:ok, _government_action} ->
        conn
        |> put_flash(:info, "Government action updated!")
        |> redirect(to: government_action_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", government_action: government_action, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    government_action = Repo.get!(GovernmentAction, id)
    Repo.delete!(government_action)

    conn
    |> put_flash(:info, "Government action deleted.")
    |> redirect(to: government_action_path(conn, :index))
  end
end
