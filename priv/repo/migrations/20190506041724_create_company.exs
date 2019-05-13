defmodule MooseApi.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:company) do
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:company, [:user_id])
  end
end
