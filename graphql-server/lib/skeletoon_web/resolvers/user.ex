defmodule Skeletoon.Resolvers.User do

  defp map_errors(data) do
    Enum.map(data, fn ({field, {content, _}}) ->
      %{field: field, message: content}
    end)
  end

  def create_user(_parent, args, _) do
    changeset = Skeletoon.Models.User.changeset(%Skeletoon.Models.User{}, args);

    case Skeletoon.Repo.insert(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, error} ->
        f = map_errors(error.errors)
        {:error, f}
    end


  end

end

