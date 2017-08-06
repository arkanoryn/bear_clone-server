defmodule BearClone.NoteView do
  use BearClone.Web, :view

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, BearClone.NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, BearClone.NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{id: note.id,
      title: note.title,
      body: note.body,
      status: note.status,
    }
  end
end
