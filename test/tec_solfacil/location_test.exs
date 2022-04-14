defmodule TecSolfacil.LocationTest do
  use TecSolfacil.DataCase

  alias TecSolfacil.Location

  describe "addresses" do
    alias TecSolfacil.Location.Address

    import TecSolfacil.LocationFixtures

    test "get_address_by_zip/1 returns the address with given zip" do
      address = address_fixture()

      assert Location.get_address_by_zip(address.zip) == address
      assert Location.get_address_by_zip("invalid_zip") == nil
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{
        zip: "12345678",
        street: "street name",
        complement: "address complement",
        district: "district name",
        city: "city name",
        state: "state name"
      }

      assert {:ok, %Address{} = address} = Location.create_address(valid_attrs)
      assert address.zip == "12345678"
      assert address.street == "street name"
      assert address.complement == "address complement"
      assert address.district == "district name"
      assert address.city == "city name"
      assert address.state == "state name"
    end

    test "create_address/1 with invalid data returns error changeset" do
      invalid_attrs = %{
        city: nil,
        complement: nil,
        district: nil,
        state: nil,
        street: nil,
        zip: nil
      }

      assert {:error, %Ecto.Changeset{}} = Location.create_address(invalid_attrs)
    end
  end
end
