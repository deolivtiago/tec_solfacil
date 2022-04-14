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
end
