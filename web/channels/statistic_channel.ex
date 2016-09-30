defmodule Exshaker.StatisticChannel do
  use Exshaker.Web, :channel

  def join("statistic:page", _payload, socket) do
    :timer.send_interval(1_000, :ping)
    {:ok, socket}
  end

  def handle_info(:ping, socket) do
    gnomes_query = from n in "nicks", where: n.race_id == 3, select: n.name
    gnomes = gnomes_query |> Repo.all |> Enum.count

    orcs_query = from n in "nicks", where: n.race_id == 1, select: n.name
    orcs = orcs_query |> Repo.all |> Enum.count

    night_elves_query = from n in "nicks", where: n.race_id == 2, select: n.name
    night_elves = night_elves_query |> Repo.all |> Enum.count

    nicks = %{orcs: orcs, night_elves: night_elves, gnomes: gnomes}
    push socket, "ping", %{nicks: nicks}

    {:noreply, assign(socket, :nicks, nicks)}
  end
end
