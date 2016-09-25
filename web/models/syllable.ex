defmodule Exshaker.Syllable do
  use Exshaker.Web, :model

  schema "syllables" do
    field :sex, :string
    field :position, :string
    field :syllable, :string
    field :namepart, :string
    belongs_to :game, Exshaker.Game
    belongs_to :race, Exshaker.Race

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:sex, :position, :syllable, :namepart])
    |> validate_required([:sex, :position, :syllable, :namepart])
  end
end
