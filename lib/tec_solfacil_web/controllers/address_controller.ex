defmodule TecSolfacilWeb.AddressController do
  use TecSolfacilWeb, :controller

  alias TecSolfacil.Location
  alias TecSolfacil.Location.Address

  action_fallback TecSolfacilWeb.FallbackController

  def show(conn, %{"zip" => zip}) do
    case Location.get_address_by_zip(zip) do
      %Address{} = address ->
        render(conn, "show.json", address: address)

      nil ->
        {:error, :not_found}
    end
  end
end
