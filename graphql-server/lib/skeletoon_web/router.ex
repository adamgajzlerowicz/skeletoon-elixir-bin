defmodule SkeletoonWeb.Router do
  use SkeletoonWeb, :router

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

  scope "/", SkeletoonWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/graphiql"  do
    pipe_through :api
    forward "/", Absinthe.Plug.GraphiQL,
            schema: Skeletoon.Schema
  end

end
