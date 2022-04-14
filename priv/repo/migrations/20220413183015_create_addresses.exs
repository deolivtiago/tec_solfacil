defmodule TecSolfacil.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :zip, :string, null: false
      add :street, :string
      add :complement, :string
      add :district, :string
      add :city, :string, null: false
      add :state, :string, null: false

      timestamps()
    end
  end
end
