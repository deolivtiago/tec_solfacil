defmodule TecSolfacilWeb.AddressController do
  use TecSolfacilWeb, :controller

  alias TecSolfacil.Location
  alias TecSolfacil.Location.Address
  alias TecSolfacilWeb.Http.ViaCEP
  alias TecSolfacilWeb.Workers

  action_fallback TecSolfacilWeb.FallbackController

  def create(conn, %{"zip" => zip}) do
    with {:ok, %Address{} = address} <- ViaCEP.create_address_by_zip(zip) do
      conn
      |> put_status(:created)
      |> render("show.json", address: address)
    end
  end

  def show(conn, %{"zip" => zip} = params) do
    case Location.get_address_by_zip(zip) do
      %Address{} = address ->
        render(conn, "show.json", address: address)

      nil ->
        create(conn, params)
    end
  end

  def csv(conn, %{"email" => email}) do
    %{email: email}
    |> Workers.CSVJob.new(schedule_in: 120)
    |> Oban.insert()

    send_resp(conn, :no_content, "")
  end
end
