defmodule BearClone.User do
  use BearClone.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based taking a empty `%BearClone.User{}` and applying the given `params`

  It returns a changeset which is used by Ecto to define the changes made.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
    |> unique_constraint(:username_already_exists, name: Username_exists)
    |> unique_constraint(:email_already_exists, name: Email_exists)
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :email])
    |> unique_constraint(:username_already_exists, name: Username_exists)
    |> unique_constraint(:email_already_exists, name: Email_exists)
  end

  @doc """
    Requests a user creation in the database and returns the answer

    In case of success, it returns :
    ```elixir
    iex(1)> params = %{username: "jdtheboss", email: "john.doe@gmail.com", name: "John Doe"}
    iex(1)> BearClone.User.create(params)
    {:ok, %BearClone.User{...}}
    ```
    Else, it would return :
    ```elixir
    {:error, cause}
    ```
    `cause` can be a simple string, but also `{:string, [:list, :of, :elements]}`
  """
  defdelegate create(params), to: BearClone.User.Alter

  @doc """
    This functions returns the matching elements depending on the given key.

    The first argument is the key that will be search with the given value.
    It returns a tuple : 

    ```elixir
    iex(1)> BearClone.User.Query.get_by(:id, 4)
    {:ok, %BearClone.User{...}}

    iex(2)> BearClone.User.Query.get_by(:id, 13)
    {:error, "[GET_BY_ID] - User 13 not found"}
    
    iex(2)> BearClone.User.Query.get_by(:blog, "yolotron")
    {:error, {"Invalid key", [list_of_valid_keys]}}
    ```
  """
  defdelegate get_by(key, val), to: BearClone.User.Query

  @doc """
    Requests the deletion of the user with the given ID.

    In case of success, it returns : 
    ```elixir
    iex(1)> BearClone.User.delete(4)
    {:ok, %BearClone.User{}}
    ```

    Else it would return : 
    ```elixir
    {:error, cause}
    ```

    `cause` can be a simple string, but also `{:string, [:list, :of, :elements]}`
  """
  defdelegate delete(id), to: BearClone.User.Alter

  @doc """
    Requets to update the user `id` with the given `params`.

    Usage : 
    ```elixir
    iex(1)> params = %{username: "jdthebest", name: "John Doe", email: "john.doe@google.com"}
    %{username: "jdthebest", name: "John Doe", email: "john.doe@google.com"}

    iex(2)> BearClone.User.create(params)
    {:ok, %BearClone.User{id: 42, username: "jdthebest", ...}}

    # Change the Username to "Krusher99"
    iex(3)> BearClone.User.update(%{username: "Krusher99"}, 42)
    {:ok, %BearClone.User{id: 42, username: "Krusher99", ...}}
    ```

    If it fails (due to the username/email already exisiting), it will return an error :
    ```elixir
    # Updating another user with the same username as John Doe uses already
    iex(3)> BearClone.User.update(%{username: "Krusher99"}, 1337)
    {:error, %Ecto.Changetset{valid?: false, errors: cause, ...}}
    ```
    The result is an Ecto error changeset, which indicated the error or conflict.
  """
  defdelegate update(params, id), to: BearClone.User.Alter
end
