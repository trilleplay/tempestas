defmodule Tempestas.API.AppleWeatherKitAPIBase do
  @moduledoc false

  use HTTPoison.Base

  @ver Tempestas.MixProject.project()[:version]

  def process_request_headers(headers) do
    [
      {"Authorization", "Bearer #{Tempestas.API.Security.JWTAuthToken.generate_token()}"},
      {"User-Agent", "Tempestas v#{@ver}"} | headers
    ]
  end
end
