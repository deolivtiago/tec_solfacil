defmodule TecSolfacil.Location.AddressTest do
  use TecSolfacil.DataCase

  describe "addresses" do
    alias Ecto.Changeset

    alias TecSolfacil.Location.Address

    test "changeset/1 with valid data returns a valid changeset" do
      valid_attrs = %{
        zip: "12.345-678",
        street: "street name",
        complement: "address complement",
        district: "district name",
        city: "city name",
        state: "state name"
      }

      assert %Changeset{valid?: true, changes: changes} = Address.changeset(valid_attrs)
      assert changes.zip == "12345678"
      assert changes.street == "street name"
      assert changes.complement == "address complement"
      assert changes.district == "district name"
      assert changes.city == "city name"
      assert changes.state == "state name"
    end

    test "changeset/1 with invalid data returns a invalid changeset" do
      invalid_attrs = %{
        zip: nil,
        street: nil,
        complement: nil,
        district: nil,
        city: nil,
        state: nil
      }

      assert %Changeset{valid?: false} = Address.changeset(invalid_attrs)
    end
  end
end
