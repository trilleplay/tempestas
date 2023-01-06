defmodule Tempestas.MixProject do
  use Mix.Project

  def project do
    [
      app: :tempestas,
      name: "Tempestas",
      version: "0.1.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "Tempestas is a simple library for the Apple WeatherKit API that handles all authentication for you.",
      deps: deps(),
      package: package(),
      docs: [extras: ["README.md"]]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Tristan Farkas"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/trilleplay/tempestas"}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:joken, "~> 2.5"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
