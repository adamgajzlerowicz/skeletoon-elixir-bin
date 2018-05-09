defmodule Skeletoon.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Skeletoon.Repo


  object :user do
    field :id, :id
    field :email, :string
    field :name, :string
  end

end
