defmodule WorldTemp.MixProject do
  use Mix.Project

  def project do
    [
      app: :world_temp,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {WorldTemp.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"},
      {:broadway, github: "plataformatec/broadway", tag: "08497708e10867935f2e92351e4cde9e4a57135e"}
    ]
  end
end
