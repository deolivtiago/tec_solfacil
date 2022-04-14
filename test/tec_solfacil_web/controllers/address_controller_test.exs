defmodule TecSolfacilWeb.AddressControllerTest do
  use TecSolfacilWeb.ConnCase

  import TecSolfacil.LocationFixtures

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show address" do
    test "renders address when zip is valid", %{conn: conn} do
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
