defmodule Exshaker.GameController do
  use Exshaker.Web, :controller

  alias Exshaker.Game

  def index(conn, _params) do
    games = Repo.all(Game)
    render(conn, "index.html", games: games)
  end

  def show(conn, %{"id" => id}) do
    game = Repo.get!(Game, id)
    render(conn, "show.html", game: game)
  end
end
