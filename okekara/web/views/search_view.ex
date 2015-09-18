defmodule Okekara.SearchView do
  use Okekara.Web, :view

  def render("index.json", %{videos: videos}) do
    %{videos: render_many(videos, Okekara.SearchView, "video.json")}
  end

  def render("video.json", %{search: video}) do
    %{
      title: video.title,
      video_id: video.video_id,
      url: video.url,
      thumbnail: video.thumbnail
    }
  end
end
