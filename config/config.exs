# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tixco_api,
  namespace: Tixco,
  ecto_repos: [Tixco.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :tixco_api, TixcoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MtfQ6hIcMh1uRTio8jeWY93KoRdWEIcJqL7sf5Gv8XWWV1ycYqXxEE2SfQ5nV5wl",
  render_errors: [view: TixcoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tixco.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Guardian
config :tixco_api, Tixco.Guardian,
issuer: "tixco_api",
secret_key: "bjEalsRaPg/ZFpXT4LOmgmFJvEIfZlqLIfn38qBEmq9EGAjEJN/VYgOgKZQpk/Yf"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure Bamboo for sending emails
config :bamboo, :json_library, Jason
config :tixco_api, Tixco.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: System.get_env("SEND_GRID_API_KEY"),
  sand_box: true # in development only

# Twilio using ExTwillio
config :ex_twilio,
  account_sid: System.get_env("TWILIO_ACCOUNT_SID"),
  auth_token: System.get_env("TWILIO_AUTH_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
