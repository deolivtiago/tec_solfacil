defmodule TecSolfacil.LocationFixtures do
  alias TecSolfacil.Location

  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        zip: "12345678",
        street: "street name",
        complement: "address complement",
        district: "district name",
        city: "city name",
        state: "state name"
      })
      |> Location.create_address()

    address
  end
end
