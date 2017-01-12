defmodule FlamingPlanet.Manage.DonationController do
  use FlamingPlanet.Web, :controller
  plug :authenticate_admin

  alias FlamingPlanet.Donation

  def index(conn, _params) do
    donations = Repo.all(Donation)
    render(conn, "index.html", donations: donations)
  end

  def new(conn, _params) do
    changeset = Donation.changeset(%Donation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"donation" => donation_params}) do
    changeset = Donation.changeset(%Donation{}, donation_params)

    case Repo.insert(changeset) do
      {:ok, _donation} ->
        conn
        |> put_flash(:info, "Donation-worthy item created!")
        |> redirect(to: manage_donation_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    donation = Repo.get!(Donation, id)
    changeset = Donation.changeset(donation)
    render(conn, "edit.html", donation: donation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "donation" => donation_params}) do
    donation = Repo.get!(Donation, id)
    changeset = Donation.changeset(donation, donation_params)

    case Repo.update(changeset) do
      {:ok, _donation} ->
        conn
        |> put_flash(:info, "Donation-worthy item updated!")
        |> redirect(to: manage_donation_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", donation: donation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    donation = Repo.get!(Donation, id)
    Repo.delete!(donation)

    conn
    |> put_flash(:info, "Donation-worthy item deleted.")
    |> redirect(to: manage_donation_path(conn, :index))
  end
end
