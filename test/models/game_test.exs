defmodule Exshaker.GameTest do
  use Exshaker.ModelCase

  alias Exshaker.Game

  @valid_attrs %{content: "some content", description: "some content", name: "some content", slug: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
