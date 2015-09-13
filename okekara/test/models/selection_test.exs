defmodule Okekara.SelectionTest do
  use Okekara.ModelCase

  alias Okekara.Selection

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Selection.changeset(%Selection{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Selection.changeset(%Selection{}, @invalid_attrs)
    refute changeset.valid?
  end
end
