defmodule BearClone.User.Query do
  @moduledoc """
    This module will only get data from the Database without modification

    None of these functions will affect the database. If you wish to do so, please use the `BearClone.User.Alter` module
  """

  alias BearClone.Repo
  @valid_key [:id, :name, :username, :email]

  @doc """
    See `BearClone.User.get_by/2`
  """
  def get_by(key, value) when key in @valid_key do
    case Repo.get_by(BearClone.User, [{key, value}]) do
      nil ->
        {:error, get_by_errmsg(key,value)}
      user ->
        {:ok, user}
    end
  end

  def get_by(_invalid_key, _value) do
    {:error, {"Invalid key expected : ", @valid_key}}
  end

  defp get_by_errmsg(key, value) do
    opt = 
      key
      |> Atom.to_string
      |> String.upcase

    "[GET_BY_#{opt}] - User #{value} not found"
  end
end 