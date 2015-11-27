defmodule Okekara.Video do
  use Okekara.Web, :model
  alias Okekara.Repo

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
    |> unique_constraint(:video_id)
  end

  def search(term) do
    GimmeKaraoke.search(term)
    |> Enum.filter(&(&1.video_id))
    |> Enum.map(fn (video) ->
      record = changeset(%__MODULE__{}, Map.from_struct(video))
      case Repo.insert(record) do
        {:ok, video} -> video
        {:error, %Ecto.Changeset{errors: [video_id: "has already been taken"]}} ->
          Repo.get_by!(__MODULE__, video_id: video.video_id)
      end
    end)
  end
end
