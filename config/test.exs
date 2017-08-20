use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rental_market, RentalMarketWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rental_market, RentalMarket.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rental_market_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
