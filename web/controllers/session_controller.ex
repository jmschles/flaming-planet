defmodule FlamingPlanet.SessionController do
  use FlamingPlanet.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{ "session" => %{ "username" => user, "password" => pass } }) do
    case FlamingPlanet.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      { :ok, conn } ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: admin_path(conn, :show))
      { :error, _reason, conn } ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> FlamingPlanet.Auth.logout()
    |> redirect(to: session_path(conn, :new))
  end
end
