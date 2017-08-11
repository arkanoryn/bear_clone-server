defmodule BearClone.NoteController do
  use BearClone.Web, :controller

  alias BearClone.Note

  def index(conn, _params) do
    notes = Repo.all(Note)

    :timer.sleep(2000)
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{"note" => note_params}) do
    changeset = Note.changeset(%Note{}, note_params)

    case Repo.insert(changeset) do
      {:ok, note} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", note_path(conn, :show, note))
        |> render("show.json", note: note)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BearClone.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Repo.get!(Note, id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Repo.get!(Note, id)
    changeset = Note.changeset(note, note_params)

    case Repo.update(changeset) do
      {:ok, note} ->
        render(conn, "show.json", note: note)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BearClone.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Repo.get!(Note, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(note)

    send_resp(conn, :no_content, "")
  end
end
