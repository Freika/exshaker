defmodule Exshaker.Repo.Migrations.CreateSyllable do
  use Ecto.Migration

  def change do
    create table(:syllables) do
      add :sex, :string
      add :position, :string
      add :syllable, :string
      add :namepart, :string
      add :game_id, references(:games, on_delete: :nothing)
      add :race_id, references(:races, on_delete: :nothing)

      timestamps()
    end
    create index(:syllables, [:game_id])
    create index(:syllables, [:race_id])
  end
end
