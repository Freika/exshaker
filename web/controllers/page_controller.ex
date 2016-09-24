defmodule Exshaker.PageController do
  use Exshaker.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
