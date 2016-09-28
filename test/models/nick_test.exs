defmodule Exshaker.NickTest do
  use Exshaker.ModelCase

  alias Exshaker.Nick

  @valid_attrs %{name: "some content", sex: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Nick.changeset(%Nick{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Nick.changeset(%Nick{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "resulting nick has correct gender"
end
