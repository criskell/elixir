defmodule Rewritetoday.MixProject do
  use Mix.Project

  def project do
    [
      app: :rewritetoday,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Rewritetoday.Application, []}
    ]
  end

  defp deps do
    [
      {:finch, "~> 0.20", optional: true},
      {:jason, "~> 1.4", optional: true},
      {:mox, "~> 1.0", only: :test}
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do: ["lib"]
end
