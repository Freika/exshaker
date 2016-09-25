defmodule Exshaker.Repo.Migrations.CreateNick do
  use Ecto.Migration

  def change do
    create table(:nicks) do
      add :name, :string
      add :sex, :string
      add :game_id, references(:games, on_delete: :nothing)
      add :race_id, references(:races, on_delete: :nothing)

      timestamps()
    end
    create index(:nicks, [:game_id])
    create index(:nicks, [:race_id])

  end
end
