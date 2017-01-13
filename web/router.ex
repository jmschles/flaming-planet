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

  scope "/", FlamingPlanet.Api do
    pipe_through :api
    resources "/daily_tasks", DailyTaskController, only: [:index]
    resources "/inspirations", InspirationController, only: [:index]
    resources "/donations", DonationController, only: [:index]
    resources "/government_actions", GovernmentActionController, only: [:index]
    resources "/news_items", NewsItemController, only: [:index]
  end

  scope "/manage", FlamingPlanet.Manage, as: :manage do
    pipe_through :browser
    resources "/daily_tasks", DailyTaskController, except: [:show]
    resources "/inspirations", InspirationController, except: [:show]
    resources "/donations", DonationController, except: [:show]
    resources "/government_actions", GovernmentActionController, except: [:show]
    resources "/news_items", NewsItemController, except: [:show]
  end
end
