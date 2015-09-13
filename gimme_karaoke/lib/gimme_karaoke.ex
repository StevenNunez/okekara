defmodule GimmeKaraoke do
  def search(term) do
    term
    |> karaokeize
    |> youtube_url_for
    |> HTTPoison.get!
    |> get_body
    |> Poison.decode!
    |> extract_items
    |> Youtube.from_youtube_items
  end

  defp extract_items(response) do
    response["items"]
  end

  defp get_body(response) do
    response.body
  end

  defp karaokeize(term) do
    term <> " karaoke"
  end

  defp youtube_url_for(term) do
    "https://www.googleapis.com/youtube/v3/search?part=snippet&key=#{System.get_env("YOUTUBE_API_KEY")}&q=#{term}&maxResults=10"
    |> URI.encode
  end
end
