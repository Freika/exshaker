# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :exshaker,
  ecto_repos: [Exshaker.Repo]

# Configures the endpoint
config :exshaker, Exshaker.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0nQAmd8pGTia/xvJ7pnt86SEpC6niVfynbgXl0GbmfkCe/3VSGyfVsPk18AK4dlv",
  render_errors: [view: Exshaker.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Exshaker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
