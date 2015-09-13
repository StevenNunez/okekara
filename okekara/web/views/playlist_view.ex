defmodule Okekara.PlaylistView do
  use Okekara.Web, :view

  def render("index.json", %{playlists: playlists}) do
    %{data: render_many(playlists, Okekara.PlaylistView, "playlist.json")}
  end

  def render("show.json", %{playlist: playlist}) do
    %{data: render_one(playlist, Okekara.PlaylistView, "playlist.json")}
  end

  def render("playlist.json", %{playlist: playlist}) do
    %{id: playlist.id,
      name: playlist.name}
  end
end
