defmodule Okekara.Video do
  use Okekara.Web, :model

  schema "videos" do
    field :title, :string
    field :video_id, :string
    field :url, :string
    field :thumbnail, :string
    has_many :selections, Okekara.Selection
    has_many :playlists, through: [:selections, :playlist]

    timestamps
  end

  @required_fields ~w(title video_id url thumbnail)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
