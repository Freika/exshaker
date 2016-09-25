defmodule Exshaker.NickView do
  use Exshaker.Web, :view

  def render("index.json", %{nicks: nicks}) do
    %{data: render_many(nicks, Exshaker.NickView, "nick.json")}
  end

  def render("show.json", %{nick: nick}) do
    %{data: render_one(nick, Exshaker.NickView, "nick.json")}
  end

  def render("nick.json", %{nick: nick}) do
    %{id: nick.id,
      name: nick.name,
      game_id: nick.game_id,
      race_id: nick.race_id,
      sex: nick.sex}
  end
end
