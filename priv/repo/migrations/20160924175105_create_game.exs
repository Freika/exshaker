defmodule Exshaker.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :content, :text
      add :slug, :string
      add :description, :string

      timestamps()
    end

  end
end
