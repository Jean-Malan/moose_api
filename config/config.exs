# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :moose_api,
  ecto_repos: [MooseApi.Repo]

# Configures the endpoint
config :moose_api, MooseApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aO4D/TuasL4XD/EMnuUotdNEFO+LSnnCtRdSbZaQx0kuy8ER71GsaoboXpw3Yz2Q",
  render_errors: [view: MooseApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MooseApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :moose_api, MooseApiWeb.Auth.Guardian,
  issuer: "moose_api",
  secret_key: "aO4D/TuasL4XD/EMnuUotdNEFO+LSnnCtRdSbZaQx0kuy8ER71GsaoboXpw3Yz2Q"