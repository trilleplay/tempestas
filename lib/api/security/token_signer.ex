defmodule Tempestas.API.Security.TokenSigner do
  @moduledoc false
  use Joken.Config

  @app Tempestas.MixProject.project()[:app]

  @impl true
  def token_config do
    default_claims(iss: Application.fetch_env!(@app, :team_id), default_exp: 60, aud: "Tempestas")
  end
end
