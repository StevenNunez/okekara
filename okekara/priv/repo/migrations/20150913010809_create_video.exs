defmodule Okekara.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :video_id, :string
      add :url, :string
      add :thumbnail, :string

      timestamps
    end

    create unique_index(:videos, [:video_id])

  end
end
