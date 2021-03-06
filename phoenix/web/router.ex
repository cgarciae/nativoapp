defmodule Nativo.Router do
  use Nativo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
  end

  scope "/", Nativo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/graphql" do
    pipe_through :api
    forward "/" , Absinthe.Plug, schema: Nativo.Schema
  end

  # Other scopes may use custom stacks.
  scope "/api", Nativo do
    pipe_through :api

    get "/worlds/:id", WorldsController, :get
    post "/worlds/:id", WorldsController, :upsert
  end
end
