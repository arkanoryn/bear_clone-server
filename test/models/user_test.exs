defmodule BearClone.UserTest do
  use BearClone.ModelCase

  alias BearClone.User

  @valid_attrs %{email: "some email", name: "some name", username: "some username"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
