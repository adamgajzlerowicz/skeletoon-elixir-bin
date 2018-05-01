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


  mutation do

    field :create_user, type: :user do
      arg :name, non_null(:string)
      arg :password, non_null(:string)
      arg :email, non_null(:string)
      resolve &Skeletoon.Resolvers.User.create_user/3
    end

  end

end
