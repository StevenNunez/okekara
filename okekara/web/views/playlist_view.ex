defmodule Okekara.PlaylistView do
  use Okekara.Web, :view

  def render("index.json", %{playlists: playlists}) do
    %{playlists: render_many(playlists, Okekara.PlaylistView, "playlist.json")}
  end

  def render("show.json", %{playlist: playlist}) do
    %{
      playlist: render_one(playlist, Okekara.PlaylistView, "playlist.json"),
      videos: render_many(playlist.videos, Okekara.VideoView, "video.json")}
  end

  def render("playlist.json", %{playlist: playlist}) do
    %{id: playlist.id,
      name: playlist.name,
      video_ids: Enum.map(playlist.videos, &(&1.id))}
  end
end
