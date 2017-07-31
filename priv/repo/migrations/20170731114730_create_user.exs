defmodule BearClone.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:users, :email, name: Email_exists)
    create unique_index(:users, :username, name: Username_exists)
  end
end
