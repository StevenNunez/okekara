defmodule Youtube do
  defstruct title: "", url: "", video_id: "", thumbnail: ""

  def from_youtube_item(item) do
    %Youtube{
      title: title_for(item),
      video_id: video_id_for(item),
      url: youtube_url_for(item),
      thumbnail: thumbail_for(item)
    }
  end

  def from_youtube_items(items) do
    Enum.map(items, &from_youtube_item(&1))
  end

  def title_for(item) do
    item["snippet"]["title"]
  end

  def thumbail_for(item) do
    item["snippet"]["thumbnails"]["default"]["url"]
  end

  def youtube_url_for(item) do
    video_id = video_id_for(item)
    "https://www.youtube.com/watch?v=#{video_id}"
  end

  def video_id_for(item) do
    item["id"]["videoId"]
  end
end
