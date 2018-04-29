defmodule Skeletoon.Schema do
  use Absinthe.Schema
  import_types Skeletoon.Schema.Types

  query do
    field :users, list_of(:user) do
      resolve fn _params, _info ->
        {:ok, Skeletoon.Repo.all(Skeletoon.User)}
      end
    end
  end
end
