defmodule Exshaker.RaceControllerTest do
  use Exshaker.ConnCase

  alias Exshaker.Race
  @valid_attrs %{content: "some content", description: "some content", name: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "shows chosen resource", %{conn: conn} do
    race = Repo.insert! %Race{}
    conn = get conn, race_path(conn, :show, race)
    assert html_response(conn, 200) =~ "Show race"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, race_path(conn, :show, -1)
    end
  end
end
