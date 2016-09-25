defmodule Exshaker.NickControllerTest do
  use Exshaker.ConnCase

  alias Exshaker.Nick
  @valid_attrs %{name: "some content", sex: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "shows chosen resource", %{conn: conn} do
    nick = Repo.insert! %Nick{}
    conn = get conn, nick_path(conn, :show, nick)
    assert json_response(conn, 200)["data"] == %{"id" => nick.id,
      "name" => nick.name,
      "game_id" => nick.game_id,
      "race_id" => nick.race_id,
      "sex" => nick.sex}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, nick_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, nick_path(conn, :create), nick: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Nick, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, nick_path(conn, :create), nick: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
