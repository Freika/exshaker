defmodule Exshaker.PageController do
  use Exshaker.Web, :controller
  alias Exshaker.Repo
  alias Exshaker.Nick
  alias Exshaker.Race

  def index(conn, _params) do
    orcs_query = from n in "nicks", where: n.race_id == 1, select: n.name
    orcs = orcs_query |> Repo.all |> Enum.count

    night_elves_query = from n in "nicks", where: n.race_id == 2, select: n.name
    night_elves = night_elves_query |> Repo.all |> Enum.count

    gnomes_query = from n in "nicks", where: n.race_id == 3, select: n.name
    gnomes = gnomes_query |> Repo.all |> Enum.count
    nicks = %{orcs: orcs, night_elves: night_elves, gnomes: gnomes}

    render(conn, "index.html", nicks: nicks)
  end
end
