use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tixco_api, TixcoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Speed up tests by decreasing security settings in test environment
config :pbkdf2_elixir, :rounds, 1

# Configure your database
config :tixco_api, Tixco.Repo,
  username: "postgres",
  password: "postgres",
  database: "tixco_test",
  hostname: "localhost",
  port: 5433,
  pool: Ecto.Adapters.SQL.Sandbox,
  migration_timestamps: [type: :utc_datetime]
