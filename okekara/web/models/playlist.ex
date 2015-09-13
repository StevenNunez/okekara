defmodule Okekara.Playlist do
  use Okekara.Web, :model

  schema "playlists" do
    field :name, :string
    has_many :selections, Okekara.Selection
    has_many :videos, through: [:selections, :video]

    timestamps
  end

  @required_fields ~w(name)
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
