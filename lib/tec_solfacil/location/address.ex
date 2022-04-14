defmodule TecSolfacil.Location.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :zip, :string
    field :street, :string
    field :complement, :string
    field :district, :string
    field :city, :string
    field :state, :string

    timestamps()
  end

  def changeset(address, attrs) do
    address
    |> cast(attrs, [:zip, :street, :complement, :district, :city, :state])
    |> validate_required([:zip, :city, :state])
    |> update_change(:zip, &Regex.replace(~r/[-|.]/, &1 || "", ""))
    |> validate_format(:zip, ~r/^[[:digit:]]+$/, message: "must be only numbers")
  end

  def changeset(attrs), do: changeset(%__MODULE__{}, attrs)
end
