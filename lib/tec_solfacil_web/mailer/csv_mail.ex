defmodule TecSolfacilWeb.Mailer.CSVEmail do
  import Swoosh.Email

  def send_email(email, attach) do
    new()
    |> to(email)
    |> from({"TecSolfacil", "noreply@tec_solfacil.com"})
    |> subject("CSV - Addresses")
    |> text_body("Hello,\nYour CSV file of addresses is attached")
    |> attachment(attach)
  end
end
