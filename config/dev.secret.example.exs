use Mix.Config

# Configure your database
config :bear_clone, BearClone.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "fancy_user_name",
  password: "cool_password",
  database: "epic_database_calling",
  hostname: "dank_host",
  # Probably Localhost 
  pool_size: 10