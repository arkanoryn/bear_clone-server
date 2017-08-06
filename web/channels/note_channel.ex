defmodule BearClone.NoteChannel do
  use BearClone.Web, :channel

  alias BearClone.Repo

  def join("notes:lobby", _params, socket) do
    # {:ok, 'ok', assign(socket, :note, 'lobby')}
    {:ok, socket}
  end

  def join("notes:" <> note_id, _params, socket) do
    note = Repo.get!(BearClone.Note, note_id)
    response = %{note: Phoenix.View.render_one(note, BearClone.NoteView, "note.json")}

    {:ok, response, assign(socket, :note, note)}
  end

  require IEx
  def handle_in("update_note", params, socket) do
    changeset =
      socket.assigns.note
    |> BearClone.Note.changeset(params)

    case Repo.update(changeset) do
      {:ok, note} ->
        broadcast_note(socket, note, Map.has_key?(changeset.changes, :title))
        {:reply, :ok, socket}
      {:error, changeset} ->
        {:reply, {:error, Phoenix.View.render(BearClone.ChangesetView, "error.json", changeset: changeset)}, socket}
    end
  end

  def terminate(_reason, socket) do
    {:ok, socket}
  end

  defp broadcast_note(socket, note, title_change?) do
    response = %{note: Phoenix.View.render_one(note, BearClone.NoteView, "note.json")}

    if (title_change?), do: BearClone.Endpoint.broadcast_from!(self(), "notes:lobby", "note_updated", response)
    broadcast!(socket, "note_updated", response)
  end
end
