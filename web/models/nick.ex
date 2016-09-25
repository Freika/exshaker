defmodule Exshaker.Nick do
  use Exshaker.Web, :model

  import Plasm

  alias Exshaker.Syllable
  alias Exshaker.Repo

  schema "nicks" do
    field :name, :string
    field :sex, :string
    belongs_to :game, Exshaker.Game
    belongs_to :race, Exshaker.Race

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :sex])
    |> validate_required([:name, :sex])
  end

  def generate(game_id, race_id, sex) do
    List.first Repo.all(from s in Syllable, select: count(s.id))

    start = get_syllable(game_id, race_id, sex, "start", "name")
    mid   = get_syllable(game_id, race_id, sex, "middle", "name")
    fin   = get_syllable(game_id, race_id, sex, "end", "name")

    "#{start}#{mid}#{fin}"

    # name_start = get_syllable('wow', race, sex, 'start', 'name')
    # name_mid   = get_syllable('wow', race, sex, 'middle', 'name')
    # name_fin   = get_syllable('wow', race, sex, 'end', 'name')
  end

  def get_syllable(game_id, race_id, sex, position, namepart) do
    query = from s in Syllable,
              where: s.game_id == ^game_id and
                     s.race_id == ^race_id and
                     s.sex == ^sex and
                     s.position == ^position and
                     s.namepart == ^namepart,
              select: s.syllable
    query = query |> random(1)
    Repo.all(query)
  end
end
