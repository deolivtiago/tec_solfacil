# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :tec_solfacil,
  ecto_repos: [TecSolfacil.Repo]

# Oban configuration
config :tec_solfacil, Oban,
  repo: TecSolfacil.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 5]

# Configures the endpoint
config :tec_solfacil, TecSolfacilWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: TecSolfacilWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TecSolfacil.PubSub,
  live_view: [signing_salt: "w5w12bDi"]

# Configures JWT authentication with Guardian
config :tec_solfacil, TecSolfacilWeb.Auth.Guardian,
  issuer: "tec_solfacil",
  secret_key: "ERnmLRtpJa4uuo0y9TAxHrGtc8uCA+1ljEYW3OGn0lruMiIaqg5VvIXSyd+rumR7"

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :tec_solfacil, TecSolfacil.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
