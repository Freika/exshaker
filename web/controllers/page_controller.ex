defmodule Exshaker.PageController do
  use Exshaker.Web, :controller

  def index(conn, _params) do
    nicks = Enum.count(Exshaker.Repo.all(Exshaker.Nick))

    render(conn, "index.html", nicks: nicks)
  end
end
