defmodule Okekara.PlaylistTest do
  use Okekara.ModelCase

  alias Okekara.Playlist

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Playlist.changeset(%Playlist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Playlist.changeset(%Playlist{}, @invalid_attrs)
    refute changeset.valid?
  end
end
