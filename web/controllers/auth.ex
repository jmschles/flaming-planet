defmodule FlamingPlanet.Auth do
  import Plug.Conn
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    admin_id = get_session(conn, :admin_id)
    admin = admin_id && repo.get(FlamingPlanet.Admin, admin_id)
    assign(conn, :current_admin, admin)
  end

  def login(conn, admin) do
    conn
    |> assign(:current_admin, admin)
    |> put_session(:admin_id, admin.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def login_by_username_and_pass(conn, username, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    admin = repo.get_by(FlamingPlanet.Admin, username: username)

    cond do
      admin && checkpw(given_pass, admin.password_hash) ->
        { :ok, login(conn, admin) }
      admin ->
        { :error, :unauthorized, conn }
      true ->
        dummy_checkpw()
        { :error, :not_found, conn }
    end
  end
end
