defmodule MooseApi.Repo.Migrations.UpdateCompanyTable do
  use Ecto.Migration

  def change do
    alter table(:company) do
      add :name, :string
      add :description, :string
      add :tag, :string

    end
  end
end
