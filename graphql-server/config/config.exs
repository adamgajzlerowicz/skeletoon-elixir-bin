# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :skeletoon,
  ecto_repos: [Skeletoon.Repo]

# Configures the endpoint
config :skeletoon, SkeletoonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bx0Yv4dEbMv90PuKh2l02jYMj2LjkgiEJIztWbKzDVoxaTcHOoiy0NHmGjL+gE3n",
  render_errors: [view: SkeletoonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Skeletoon.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
