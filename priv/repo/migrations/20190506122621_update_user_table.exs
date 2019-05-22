defmodule MooseApi.Repo.Migrations.UpdateUserTable do
  use Ecto.Migration

  def change do
    alter table(:user) do
      # remove :email
      # add :email, :unique

    end
  end
end
