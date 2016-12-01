defmodule FlamingPlanet.Api.DailyTaskControllerTest do
  use FlamingPlanet.ConnCase

  alias FlamingPlanet.Api.DailyTask
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, daily_task_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    daily_task = Repo.insert! %DailyTask{}
    conn = get conn, daily_task_path(conn, :show, daily_task)
    assert json_response(conn, 200)["data"] == %{"id" => daily_task.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, daily_task_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, daily_task_path(conn, :create), daily_task: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DailyTask, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, daily_task_path(conn, :create), daily_task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    daily_task = Repo.insert! %DailyTask{}
    conn = put conn, daily_task_path(conn, :update, daily_task), daily_task: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DailyTask, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    daily_task = Repo.insert! %DailyTask{}
    conn = put conn, daily_task_path(conn, :update, daily_task), daily_task: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    daily_task = Repo.insert! %DailyTask{}
    conn = delete conn, daily_task_path(conn, :delete, daily_task)
    assert response(conn, 204)
    refute Repo.get(DailyTask, daily_task.id)
  end
end
