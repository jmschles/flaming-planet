defmodule FlamingPlanet.Manage.InspirationController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin when action in [:new, :create, :index, :show]

  alias FlamingPlanet.Inspiration

  def index(conn, _params) do
    inspirations = Repo.all(Inspiration)
    render(conn, "index.html", inspirations: inspirations)
  end

  def new(conn, _params) do
    changeset = Inspiration.changeset(%Inspiration{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inspiration" => inspiration_params}) do
    changeset = Inspiration.changeset(%Inspiration{}, inspiration_params)

    case Repo.insert(changeset) do
      {:ok, _inspiration} ->
        conn
        |> put_flash(:info, "Inspiration created!")
        |> redirect(to: inspiration_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inspiration = Repo.get!(Inspiration, id)
    render(conn, "show.html", inspiration: inspiration)
  end

  def edit(conn, %{"id" => id}) do
    inspiration = Repo.get!(Inspiration, id)
    changeset = Inspiration.changeset(inspiration)
    render(conn, "edit.html", inspiration: inspiration, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inspiration" => inspiration_params}) do
    inspiration = Repo.get!(Inspiration, id)
    changeset = Inspiration.changeset(inspiration, inspiration_params)

    case Repo.update(changeset) do
      {:ok, inspiration} ->
        conn
        |> put_flash(:info, "Inspiration updated!")
        |> redirect(to: inspiration_path(conn, :show, inspiration))
      {:error, changeset} ->
        render(conn, "edit.html", inspiration: inspiration, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inspiration = Repo.get!(Inspiration, id)
    Repo.delete!(inspiration)

    conn
    |> put_flash(:info, "Inspiration deleted")
    |> redirect(to: inspiration_path(conn, :index))
  end
end
