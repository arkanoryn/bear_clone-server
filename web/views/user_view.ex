defmodule BearClone.UserView do
  use BearClone.Web, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
    }
  end
end
