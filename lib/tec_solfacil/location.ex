defmodule TecSolfacil.Location do
  import Ecto.Query, warn: false

  alias TecSolfacil.Location.Address
  alias TecSolfacil.Repo

  def get_address_by_zip(zip), do: Repo.get_by(Address, zip: zip)

  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

  def generate_csv do
    path = "addresses.csv"

    data =
      Address
      |> Repo.all()
      |> Enum.reduce(
        "zip,street,complement,district,city,state",
        &"#{&2}\n#{&1.zip},#{&1.street},#{&1.complement},#{&1.district},#{&1.city},#{&1.state}"
      )

    File.write!(path, data)

    {:ok, path}
  end
end
