defmodule TecSolfacilWeb.Http.ViaCEP.Client do
  use Tesla

  alias Tesla.Env

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br"
  plug Tesla.Middleware.Headers, [{"User-Agent", "Mozilla/5.0"}]
  plug Tesla.Middleware.JSON

  @error {:error, :not_found}

  def get_address_by_zip(zip) do
    "/ws/#{zip}/json"
    |> get()
    |> handle_response()
    |> cast_attrs()
  end

  defp handle_response({:ok, %Env{status: 200, body: %{"erro" => "true"}}}), do: @error

  defp handle_response({:ok, %Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_response(_other_response), do: @error

  defp cast_attrs({:ok, body}) do
    attrs = %{
      "zip" => body["cep"],
      "street" => body["logradouro"],
      "complement" => body["complemento"],
      "district" => body["bairro"],
      "city" => body["localidade"],
      "state" => body["uf"]
    }

    {:ok, attrs}
  end

  defp cast_attrs(error), do: error
end
