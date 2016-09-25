defmodule Exshaker.SyllableTest do
  use Exshaker.ModelCase

  alias Exshaker.Syllable

  @valid_attrs %{namepart: "some content", position: "some content", sex: "some content", syllable: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Syllable.changeset(%Syllable{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Syllable.changeset(%Syllable{}, @invalid_attrs)
    refute changeset.valid?
  end
end
