defmodule TecSolfacil.AccountsFixtures do
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some_email@mail.com",
        name: "some name",
        password: "some_password"
      })
      |> TecSolfacil.Accounts.create_user()

    user
  end
end
