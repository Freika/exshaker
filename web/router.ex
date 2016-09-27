defmodule Exshaker.Router do
  use Exshaker.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Exshaker do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/games", GameController, only: [:index, :show] do
      resources "/races", RaceController, only: [:show]
    end
  end

  scope "/api", Exshaker do
    pipe_through :api

    get "/nicks/:id", NickController, :show
    post "/nicks", NickController, :create
  end
end
