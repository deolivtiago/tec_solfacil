defmodule TecSolfacilWeb.AddressView do
  use TecSolfacilWeb, :view
  alias TecSolfacilWeb.AddressView

  def render("show.json", %{address: address}) do
    %{data: render_one(address, AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{
      id: address.id,
      zip: address.zip,
      street: address.street,
      complement: address.complement,
      district: address.district,
      city: address.city,
      state: address.state
    }
  end
end
