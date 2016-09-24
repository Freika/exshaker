defmodule Exshaker.Repo.Migrations.CreateRace do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :title, :string
      add :name, :string
      add :content, :text
      add :slug, :string
      add :description, :string
      add :game_id, references(:games, on_delete: :nothing)

      timestamps()
    end
    create index(:races, [:game_id])

  end
end
