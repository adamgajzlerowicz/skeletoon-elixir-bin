defmodule Skeletoon.Resolvers.User do

  def create_user(_parent, args, _) do
    Skeletoon.Repo.insert(
        args
    )
  end

end

