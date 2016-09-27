defmodule Exshaker.GameController do
  use Exshaker.Web, :controller

  alias Exshaker.Game
  alias Exshaker.Race

  def index(conn, _params) do
    games = Repo.all(Game)
    render(conn, "index.html", games: games)
  end

  def show(conn, %{"id" => id}) do
    game = Repo.get!(Game, id)
    races = Repo.all(from r in Race, where: r.game_id == ^game.id)

    render(conn, "show.html", game: game, races: races)
  end
end
