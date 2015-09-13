defmodule Okekara.Repo.Migrations.CreateSelection do
  use Ecto.Migration

  def change do
    create table(:selections) do
      add :video_id, references(:videos)
      add :playlist_id, references(:playlists)

      timestamps
    end
    create index(:selections, [:video_id])
    create index(:selections, [:playlist_id])

  end
end
