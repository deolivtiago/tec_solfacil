defmodule TecSolfacilWeb.ViaCEPFixtures do
  @base_url "https://viacep.com.br"

  @body %{
    "cep" => "12345-678",
    "logradouro" => "street name",
    "complemento" => "address complement",
    "bairro" => "district name",
    "localidade" => "city name",
    "uf" => "state code",
    "ibge" => "1234567",
    "gia" => "",
    "ddd" => "99",
    "siafi" => "1234"
  }

  def mock_client do
    Tesla.Mock.mock(fn
      %{method: :get, url: @base_url <> "/ws/valid_zip/json"} ->
        %Tesla.Env{status: 200, body: @body}

      %{method: :get, url: @base_url <> "/ws/invalid_zip/json"} ->
        %Tesla.Env{status: 200, body: %{"erro" => "true"}}
    end)
  end
end
