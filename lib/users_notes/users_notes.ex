defmodule BearClone.UsersNotes do
   
    alias BearClone.Repo

    def linker(user, note) do
        loaded_user = user |> Repo.preload(:notes)
        loaded_note = note |> Repo.preload(:users)

        changeset = Ecto.Changeset.change(loaded_user) |> Ecto.Changeset.put_assoc(:notes, [loaded_note])
        Repo.update!(changeset)
    end
end