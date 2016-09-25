defmodule Exshaker.Nick do
  use Exshaker.Web, :model

  require IEx

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
    |> cast(params, [:game_id, :race_id, :sex])
    |> validate_required([:game_id, :race_id, :sex])
    |> put_change(:name, generate(params))
  end

  def generate(params) do
    game_id = params["game_id"]
    race_id = params["race_id"]
    sex     = params["sex"]

    start = get_syllable(game_id, race_id, sex, "start", "name")
    mid   = get_syllable(game_id, race_id, sex, "middle", "name")
    fin   = get_syllable(game_id, race_id, sex, "end", "name")

    "#{start}#{mid}#{fin}"
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
