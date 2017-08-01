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

  test "Create a User" do
    assert {:ok, _user} = BearClone.User.create(@valid_attrs)

    assert {:error, %{valid?: false}} = BearClone.User.create(@valid_attrs)
  end

  test "Creating an Invalid user" do
    assert {:error, %{valid?: false}} = BearClone.User.create(@invalid_attrs)
  end

  test "Deleting a User" do
    assert {:ok, user} = BearClone.User.create(@valid_attrs)
    assert {:ok, same_user} = BearClone.User.delete(user.id)

    assert %{__meta__: %{state: :loaded}} = user
    assert %{__meta__: %{state: :deleted}} = same_user
  end

  test "Deleting a deleted or invalid User" do
    assert {:ok, user} = BearClone.User.create(@valid_attrs)
    assert {:ok, _same_user} = BearClone.User.delete(user.id)

    string = "[GET_BY_ID] - User #{user.id} not found"
    assert {:error, string} == BearClone.User.delete(user.id)
  end

  test "Update user" do
    assert {:ok, user} = BearClone.User.create(@valid_attrs)

    assert {:ok, user_too} = BearClone.User.update(%{username: "Chuck Norris"}, user.id)
    assert user.id == user_too.id
    refute user.username == user_too.username
  end
end
