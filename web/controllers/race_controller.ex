defmodule Exshaker.RaceController do
  use Exshaker.Web, :controller

  alias Exshaker.Race
  alias Exshaker.Game

  def show(conn, %{"id" => id}) do
    race = Repo.get!(Race, id)
    game = Repo.get!(Game, race.game_id)
    render(conn, "show.html", race: race, game: game)
  end
end
