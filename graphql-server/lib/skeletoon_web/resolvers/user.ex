defmodule Skeletoon.Resolvers.User do

  def create_user(_parent, args, _) do
    changeset = Skeletoon.User.changeset(%Skeletoon.User{}, args);

    case Skeletoon.Repo.insert(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, error} ->
        f = Enum.map(error.errors, fn ({field, {content, _}}) ->
          %{field: field, message: content}
        end)
        {:error, f}
    end


  end

end

