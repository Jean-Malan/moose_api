defmodule MooseApi.Repo.Migrations.CreateGeneralJournalEntries do
  use Ecto.Migration

  def change do
    create table(:general_journal_entries) do
      add :description, :text
      add :gross_amount, :float
      add :net_amount, :float
      add :transaction_type, :integer
      add :vat_amount, :float
      add :gl_account_id, references(:gl_account, on_delete: :nothing)
      add :general_journal_id, references(:general_journal, on_delete: :nothing)
      add :product_id, references(:product, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:general_journal_entries, [:gl_account_id])
    create index(:general_journal_entries, [:general_journal_id])
    create index(:general_journal_entries, [:product_id])
    create index(:general_journal_entries, [:user_id])
    create index(:general_journal_entries, [:company_id])
  end
end
