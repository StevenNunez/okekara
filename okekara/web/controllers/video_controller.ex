defmodule Okekara.VideoController do
  use Okekara.Web, :controller

  alias Okekara.Video

  def index(conn, params) do
    videos = Video.search(params["q"])
    render(conn, "index.json", videos: videos)
  end
end
