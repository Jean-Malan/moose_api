defmodule MooseApi.Repo.Migrations.CreateCreditNoteEntries do
  use Ecto.Migration

  def change do
    create table(:credit_note_entries) do
      add :description, :string
      add :quantity, :float
      add :net_price, :float
      add :vat_type, :integer
      add :gross_price, :float
      add :vat_amount, :float
      add :product_id, references(:product, on_delete: :nothing)
      add :sale_invoice_id, references(:sales_invoice, on_delete: :nothing)
      add :gl_account_id, references(:gl_account, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:credit_note_entries, [:product_id])
    create index(:credit_note_entries, [:sale_invoice_id])
    create index(:credit_note_entries, [:gl_account_id])
    create index(:credit_note_entries, [:user_id])
    create index(:credit_note_entries, [:company_id])
  end
end
