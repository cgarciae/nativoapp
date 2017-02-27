# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nativo,
  ecto_repos: [Nativo.Repo]

# Configures the endpoint
config :nativo, Nativo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7dY3dhW7sYTD5rdYy4nac1T8JovvVQMxKRdMm+tUI2FbpEgjU4Ybj21Pye8KCRcZ",
  render_errors: [view: Nativo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nativo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
