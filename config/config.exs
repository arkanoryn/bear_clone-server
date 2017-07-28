# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bear_clone,
  ecto_repos: [BearClone.Repo]

# Configures the endpoint
config :bear_clone, BearClone.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Uc37wmnOCXtmA1j6uT+JpS0Jhf5K4RB+xP+O0/3G+UOYIx6JZQ1zqt4NRmP0i7yC",
  render_errors: [view: BearClone.ErrorView, accepts: ~w(json)],
  pubsub: [name: BearClone.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
