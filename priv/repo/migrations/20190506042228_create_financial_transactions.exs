defmodule MooseApi.Repo.Migrations.CreateFinancialTransactions do
  use Ecto.Migration

  def change do
    create table(:financial_transactions) do
      add :gross_amount, :float
      add :net_amount, :float
      add :notes, :text
      add :transaction_reference, :string
      add :transaction_date, :naive_datetime
      add :transaction_type, :integer
      add :vat_amount, :float
      add :vat_type, :float
      add :bank_account_id, references(:bank_account, on_delete: :nothing)
      add :contact_id, references(:contact, on_delete: :nothing)
      add :gl_account_id, references(:gl_account, on_delete: :nothing)
      add :purchase_invoice_id, references(:purchase_invoice, on_delete: :nothing)
      add :sale_invoice_id, references(:sales_invoice, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:financial_transactions, [:bank_account_id])
    create index(:financial_transactions, [:contact_id])
    create index(:financial_transactions, [:gl_account_id])
    create index(:financial_transactions, [:purchase_invoice_id])
    create index(:financial_transactions, [:sale_invoice_id])
    create index(:financial_transactions, [:user_id])
    create index(:financial_transactions, [:company_id])
  end
end
