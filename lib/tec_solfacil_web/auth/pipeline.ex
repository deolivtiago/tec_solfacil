defmodule TecSolfacilWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :tec_solfacil,
    error_handler: TecSolfacilWeb.Auth.ErrorHandler,
    module: TecSolfacilWeb.Auth.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
