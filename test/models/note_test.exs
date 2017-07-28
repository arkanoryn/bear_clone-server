defmodule BearClone.NoteTest do
  use BearClone.ModelCase

  alias BearClone.Note

  @valid_attrs %{body: Faker.Lorem.paragraph(2..5), title: Faker.Lorem.sentence(3..10)}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Note.changeset(%Note{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Note.changeset(%Note{}, @invalid_attrs)
    refute changeset.valid?
  end
end
