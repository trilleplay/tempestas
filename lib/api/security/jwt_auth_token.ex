defmodule Tempestas.API.Security.JWTAuthToken do
  @moduledoc false
  @app Tempestas.MixProject.project()[:app]

  def generate_token do
    {:ok, token, _} =
      Tempestas.API.Security.TokenSigner.generate_and_sign(
        %{"sub" => Application.fetch_env!(@app, :service_id)},
        Joken.Signer.create("ES256", %{"pem" => Application.fetch_env!(@app, :private_key)}, %{
          "kid" => Application.fetch_env!(@app, :key_id),
          "id" =>
            "#{Application.fetch_env!(@app, :team_id)}.#{Application.fetch_env!(@app, :service_id)}"
        })
      )

    token
  end
end
