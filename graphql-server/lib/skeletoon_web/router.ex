defmodule SkeletoonWeb.Router do
  use SkeletoonWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(SkeletoonWeb.Auth)
  end

  scope "/", SkeletoonWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api/v1", SkeletoonWeb do
    pipe_through(:api)

    resources("/users", UserController, except: [:new, :edit])
  end

  scope "/graphiql" do
    pipe_through(:api)
    forward("/", Absinthe.Plug.GraphiQL, schema: Skeletoon.Schema)
  end
end
