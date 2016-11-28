defmodule FlamingPlanet.AdminController do
  use FlamingPlanet.Web, :controller

  alias FlamingPlanet.Admin

  def show(conn, _params) do
    if conn.assigns.current_admin do
      render conn, "show.html", admin: conn.assigns.current_admin
    else
      redirect(conn, to: session_path(conn, :new))
    end
  end
end
