defmodule Exshaker.RaceController do
  use Exshaker.Web, :controller

  alias Exshaker.Race
  alias Exshaker.Game

  def index(conn, _params) do
    races = Repo.all(Race)
      |> Repo.preload(:game)
    render(conn, "index.html", races: races)
  end

  def show(conn, %{"id" => id}) do
    race = Repo.get!(Race, id)
    game = Repo.get!(Game, race.game_id)
    render(conn, "show.html", race: race, game: game)
  end
end
