defmodule MooseApi.Repo.Migrations.CreateBankAccount do
  use Ecto.Migration

  def change do
    create table(:bank_account) do
      add :title, :string
      add :opening_balance, :float
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:bank_account, [:user_id])
    create index(:bank_account, [:company_id])
  end
end
