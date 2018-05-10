# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Skeletoon.Repo.insert!(%Skeletoon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

adam = Skeletoon.Repo.insert! %Skeletoon.Models.User{
  email: "nelf86@gmail.com",
  name: "nelf",
  password_hash: Comeonin.Bcrypt.hashpwsalt("123")
}
