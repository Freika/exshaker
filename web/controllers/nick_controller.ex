defmodule Exshaker.NickController do
  use Exshaker.Web, :controller

  alias Exshaker.Nick

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
end
