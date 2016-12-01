defmodule FlamingPlanet.Router do
  use FlamingPlanet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug FlamingPlanet.Auth, repo: FlamingPlanet.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlamingPlanet do
    pipe_through :browser
    get "/", PageController, :index
    resources "/admin", AdminController, only: [:show], singleton: true

    get "/login", SessionController, :new
    resources "/sessions", SessionController, only: [:create, :delete]
  end

  scope "/manage", FlamingPlanet do
    pipe_through :browser
    resources "/daily_tasks", Manage.DailyTaskController, only: [:index, :show, :new, :create]
  end

  scope "/api", FlamingPlanet do
    pipe_through :api


  end
end
