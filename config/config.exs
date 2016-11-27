# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :flaming_planet,
  ecto_repos: [FlamingPlanet.Repo]

# Configures the endpoint
config :flaming_planet, FlamingPlanet.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ANXIhG2wMdN57Tr+Z1+siPDd9bx4Yt37PfooDTbbD6cVeHu1eh6NWeFvBmNurZcS",
  render_errors: [view: FlamingPlanet.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FlamingPlanet.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
