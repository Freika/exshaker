defmodule Exshaker.Game do
  use Exshaker.Web, :model

  schema "games" do
    field :name, :string
    field :content, :string
    field :slug, :string
    field :description, :string
    has_many :races, Exshaker.Race
    has_many :syllables, Exshaker.Syllable
    has_many :nicks, Exshaker.Nick

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :content, :slug, :description])
    |> validate_required([:name, :content, :slug, :description])
  end
end
