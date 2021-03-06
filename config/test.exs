import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :tec_solfacil, TecSolfacil.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tec_solfacil_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tec_solfacil, TecSolfacilWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/pYl48EDlfXHxaAp7QPhd5DxM2g97NhNV6dqa7bSyu8t4JZC+HAk5k3EUtenNZV2",
  server: false

# In test we don't send emails.
config :tec_solfacil, TecSolfacil.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Mock Tesla Client
config :tesla, TecSolfacilWeb.Http.ViaCEP.Client, adapter: Tesla.Mock
