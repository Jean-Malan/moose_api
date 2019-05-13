defmodule MooseApi.Repo.Migrations.CreatePurchasesEntries do
  use Ecto.Migration

  def change do
    create table(:purchases_entries) do
      add :description, :string
      add :gross_price, :float
      add :net_price, :float
      add :quantity, :float
      add :vat_price, :float
      add :vat_type, :integer
      add :company_id, references(:company, on_delete: :nothing)
      add :gl_account_id, references(:gl_account, on_delete: :nothing)
      add :product_id, references(:product, on_delete: :nothing)
      add :purchase_invoice_id, references(:purchase_invoice, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:purchases_entries, [:company_id])
    create index(:purchases_entries, [:gl_account_id])
    create index(:purchases_entries, [:product_id])
    create index(:purchases_entries, [:purchase_invoice_id])
    create index(:purchases_entries, [:user_id])
  end
end
