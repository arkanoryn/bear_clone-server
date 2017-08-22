defmodule BearClone.Repo.Migrations.UsersNotes do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :note_ids, references(:notes, on_delete: :nilify_all)
    end

    create table(:users_notes) do
      add :note_id, references(:notes, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
