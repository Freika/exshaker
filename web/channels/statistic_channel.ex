defmodule Exshaker.StatisticChannel do
  use Exshaker.Web, :channel

  def join("statistic:page", _payload, socket) do
    {:ok, socket}
  end
end
