defmodule Okekara.Repo.Migrations.CreatePlaylist do
  use Ecto.Migration

  def change do
    create table(:playlists) do
      add :name, :string

      timestamps
    end
    create unique_index(:playlists, [:name])
  end
end
