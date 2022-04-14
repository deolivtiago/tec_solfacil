defmodule TecSolfacilWeb.Http.ViaCEP do
  alias TecSolfacil.Location
  alias TecSolfacilWeb.Http.ViaCEP.Client

  def create_address_by_zip(zip) do
    with {:ok, attrs} <- Client.get_address_by_zip(zip) do
      Location.create_address(attrs)
    end
  end
end
