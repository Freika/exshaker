defmodule Exshaker.RaceTest do
  use Exshaker.ModelCase

  alias Exshaker.Race

  @valid_attrs %{content: "some content", description: "some content", name: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Race.changeset(%Race{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Race.changeset(%Race{}, @invalid_attrs)
    refute changeset.valid?
  end
end
