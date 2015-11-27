defmodule Okekara.VideoView do
  use Okekara.Web, :view

  def render("index.json", %{videos: videos}) do
    %{videos: render_many(videos, Okekara.VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{
      id: video.id,
      title: video.title,
      video_id: video.video_id,
      url: video.url,
      thumbnail: video.thumbnail
    }
  end
end
