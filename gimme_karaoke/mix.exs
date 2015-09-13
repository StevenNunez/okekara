defmodule GimmeKaraoke.Mixfile do
  use Mix.Project

  def project do
    [app: :gimme_karaoke,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [
      applications: app_list(Mix.env)
    ]
  end

  defp app_list(:dev), do: [:dotenv | app_list]
  defp app_list(_), do: app_list
  defp app_list, do: [:logger, :httpoison]

  defp deps do
    [
       {:poison, "~> 1.5"},
       {:httpoison, "~> 0.7.2"},
       {:dotenv, "~> 1.0.0"}
    ]
  end
end
