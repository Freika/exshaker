defmodule Exshaker.NickController do
  use Exshaker.Web, :controller

  alias Exshaker.Nick

  require IEx

  def index(conn, _params) do
    nicks = Repo.all(Nick)
    render(conn, "index.json", nicks: nicks)
  end

  def create(conn, nick_params) do
    changeset = Nick.changeset(%Nick{}, nick_params)

    case Repo.insert(changeset) do
      {:ok, nick} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", nick_path(conn, :show, nick))
        |> render("show.json", nick: nick)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Exshaker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    nick = Repo.get!(Nick, id)
    render(conn, "show.json", nick: nick)
  end

  def update(conn, %{"id" => id, "nick" => nick_params}) do
    nick = Repo.get!(Nick, id)
    changeset = Nick.changeset(nick, nick_params)

    case Repo.update(changeset) do
      {:ok, nick} ->
        render(conn, "show.json", nick: nick)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Exshaker.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    nick = Repo.get!(Nick, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(nick)

    send_resp(conn, :no_content, "")
  end
end
