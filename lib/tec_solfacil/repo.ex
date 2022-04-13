defmodule TecSolfacil.Repo do
  use Ecto.Repo,
    otp_app: :tec_solfacil,
    adapter: Ecto.Adapters.Postgres
end
