# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BearClone.Repo.insert!(%BearClone.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

general = "GENERAL"
trash = "TRASH"

note_1 = %BearClone.Note{title: "This is my first note", body: "and its body.", status: general}
note_2 = %BearClone.Note{title: "Overwatch", body: "All Overwatch players are lazy ppl. Everybody knows it... :/", status: general}
BearClone.Repo.insert!(note_1)
BearClone.Repo.insert!(note_2)

get_status = fn () ->
  if (Enum.random(0..1) == 0) do
    general
  else
    trash
  end
end

insert_random_note = fn () ->
 %BearClone.Note{title: Faker.Pokemon.name(), body: Faker.Lorem.paragraph(20..30), status: get_status.()}
 |> BearClone.Repo.insert!
end

1..10 |> Enum.each(fn(_x) -> insert_random_note.() end)
