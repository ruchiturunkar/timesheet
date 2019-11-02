# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheet1.Repo.insert!(%Timesheet1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#
alias Timesheet1.Repo
alias Timesheet1.Users.User

Repo.insert!(%User{name: "Ruchti", email: "ruchit.urunkar@acme.com", isManager: false, manager: "Ana"})
Repo.insert!(%User{name: "Ana", email: "ana.bollinger@acme.com", isManager: true, manager: "Ana"})
