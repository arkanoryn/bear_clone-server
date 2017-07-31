defmodule BearClone.User.Alter do
  @moduledoc """
    This module modifies the content of the user database.

    Each function will change or add a user (a modification will happen)
    If you want to query the database (only get/find), use the `BearClose.User.Query` module
  """

  alias BearClone.User

  @doc false
  def rand() do
    %{username: Faker.Internet.user_name, email: Faker.Internet.email, name: Faker.Name.name}
  end
  
  @doc """
   See `BearClone.User.create/1`
  """
  def create(params \\ :invalid) do
    User.changeset(%User{}, params)
    |> BearClone.Repo.insert()
  end

  @doc """
   See `BearClone.User.delete/1`
  """
  def delete(id) do
    case User.Query.get_by(:id, id) do
      {:ok, user} ->
        BearClone.Repo.delete(user)
      other ->
        other
    end
  end

  @doc """
   See `BearClone.User.update/2`
  """
  def update(params, id) do
    case BearClone.User.get_by(:id, id) do
      {:ok, user} ->
        BearClone.User.update_changeset(user, params)
        |> BearClone.Repo.update()
      other ->
        other
    end
  end
end