defmodule TecSolfacilWeb.AddressControllerTest do
  use TecSolfacilWeb.ConnCase

  import TecSolfacil.LocationFixtures
  import TecSolfacilWeb.ViaCEPFixtures

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}

    mock_client()
  end

  describe "create address" do
    test "renders address when zip is valid and the address does not exist", %{conn: conn} do
      conn = get(conn, Routes.address_path(conn, :show, "valid_zip"))

      assert %{
               "zip" => zip,
               "street" => street,
               "complement" => complement,
               "district" => district,
               "city" => city,
               "state" => state
             } = json_response(conn, 201)["data"]

      assert zip == "12345678"
      assert street == "street name"
      assert complement == "address complement"
      assert district == "district name"
      assert city == "city name"
      assert state == "state code"
    end
  end

  describe "show address" do
    test "renders address when zip is valid and the address exists", %{conn: conn} do
      address = address_fixture()

      conn = get(conn, Routes.address_path(conn, :show, address.zip))

      assert %{
               "zip" => zip,
               "street" => street,
               "complement" => complement,
               "district" => district,
               "city" => city,
               "state" => state
             } = json_response(conn, 200)["data"]

      assert address.zip == zip
      assert address.street == street
      assert address.complement == complement
      assert address.district == district
      assert address.city == city
      assert address.state == state
    end

    test "renders error when zip is invalid", %{conn: conn} do
      conn = get(conn, Routes.address_path(conn, :show, "invalid_zip"))
      assert json_response(conn, 404)["errors"] != %{}
    end
  end
end
