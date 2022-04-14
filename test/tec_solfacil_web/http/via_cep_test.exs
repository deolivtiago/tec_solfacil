defmodule TecSolfacilWeb.Http.ViaCEPTest do
  use ExUnit.Case

  import TecSolfacilWeb.ViaCEPFixtures

  alias TecSolfacil.Repo
  alias TecSolfacil.Location.Address
  alias TecSolfacilWeb.Http.ViaCEP

  setup do
    mock_client()
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "viacep" do
    test "create_address_by_zip/1 with valid zip creates or gets an address" do
      assert {:ok, %Address{} = address} = ViaCEP.create_address_by_zip("valid_zip")

      assert address.zip == "12345678"
      assert address.street == "street name"
      assert address.complement == "address complement"
      assert address.district == "district name"
      assert address.city == "city name"
      assert address.state == "state code"
    end

    test "create_address_by_zip/1 with invalid zip returns a not found error" do
      assert {:error, :not_found} = ViaCEP.create_address_by_zip("invalid_zip")
    end
  end
end
