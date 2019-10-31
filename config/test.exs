use Mix.Config

# Configure your database
config :timesheet1, Timesheet1.Repo,
  username: "timesheet2",
  password: "chael8Cha0iu",
  database: "timesheet1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheet1, Timesheet1Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
