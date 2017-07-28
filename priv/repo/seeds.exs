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

note_1 = %BearClone.Note{title: "This is my first note", body: "and its body."}
note_2 = %BearClone.Note{title: "Overwatch", body: "All Overwatch players are lazy ppl. Everybody knows it... :/"}

BearClone.Repo.insert!(note_1)
BearClone.Repo.insert!(note_2)
