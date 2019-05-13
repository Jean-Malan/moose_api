defmodule MooseApi.Repo.Migrations.CreateGlAccount do
  use Ecto.Migration

  def change do
    create table(:gl_account) do
      add :title, :string
      add :account_code, :string
      add :account_type, :integer
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:gl_account, [:user_id])
    create index(:gl_account, [:company_id])
  end
end
