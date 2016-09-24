defmodule Exshaker.Race do
  use Exshaker.Web, :model

  schema "races" do
    field :title, :string
    field :name, :string
    field :content, :string
    field :slug, :string
    field :description, :string
    belongs_to :game, Exshaker.Game

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :name, :content, :slug, :description])
    |> validate_required([:title, :name, :content, :slug, :description])
  end
end
