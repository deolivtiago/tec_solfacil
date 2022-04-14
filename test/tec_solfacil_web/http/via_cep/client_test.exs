defmodule TecSolfacilWeb.Http.ViaCEP.ClientTest do
  use ExUnit.Case

  import TecSolfacilWeb.ViaCEPFixtures

  alias TecSolfacilWeb.Http.ViaCEP.Client

  setup do
    mock_client()
  end

  describe "client" do
    test "get_address_by_zip/1 with valid zip returns valid data" do
      assert {:ok, attrs} = Client.get_address_by_zip("valid_zip")

      assert attrs["zip"] == "12345-678"
      assert attrs["street"] == "street name"
      assert attrs["complement"] == "address complement"
      assert attrs["district"] == "district name"
      assert attrs["city"] == "city name"
      assert attrs["state"] == "state code"
    end

    test "get_address_by_zip/1 with invalid zip returns an error" do
      assert {:error, :not_found} = Client.get_address_by_zip("invalid_zip")
    end
  end
end
