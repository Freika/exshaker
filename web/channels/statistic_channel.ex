defmodule Exshaker.StatisticChannel do
  use Exshaker.Web, :channel

  def join("statistic:page", _payload, socket) do
    :timer.send_interval(1_000, :ping)
    {:ok, socket}
  end

  def handle_info(:ping, socket) do
    nicks = Enum.count(Exshaker.Repo.all(Exshaker.Nick))
    push socket, "ping", %{nicks: nicks}

    {:noreply, assign(socket, :nicks, nicks)}
  end
end
