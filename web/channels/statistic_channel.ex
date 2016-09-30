defmodule Exshaker.StatisticChannel do
  use Exshaker.Web, :channel

  def join("statistic:page", _payload, socket) do
    :timer.send_interval(2_000, :ping)
    {:ok, socket}
  end

  def handle_info(:ping, socket) do
    count = socket.assigns[:count] || 1
    push socket, "ping", %{count: count}

    {:noreply, assign(socket, :count, count + 1)}
  end
end
