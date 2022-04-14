defmodule TecSolfacil.AccountsFixtures do
  defp unique_user_email, do: "some_email#{System.unique_integer([:positive])}@mail.com"

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        name: "some name",
        password: "some_password"
      })
      |> TecSolfacil.Accounts.create_user()

    user
  end
end
