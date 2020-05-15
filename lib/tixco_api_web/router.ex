defmodule TixcoWeb.Router do
  use TixcoWeb, :router

  alias Tixco.Guardian

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

  pipeline :auth do
    plug Guardian.AuthPipeline
  end

  scope "/", TixcoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/v1", TixcoWeb do
    pipe_through [:api]

    post "/signup", UserController, :create
    post "/login", UserController, :login
  end
end
