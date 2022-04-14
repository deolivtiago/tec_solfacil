defmodule TecSolfacilWeb.Workers.CSVJob do
  use Oban.Worker, queue: :default

  alias TecSolfacil.Location
  alias TecSolfacilWeb.Mailer.CSVEmail

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"email" => email}}) do
    {:ok, attach_path} = Location.generate_csv()

    email
    |> CSVEmail.send_email(attach_path)
    |> TecSolfacil.Mailer.deliver()

    :ok
  end
end
