defmodule MooseApi.Repo.Migrations.CreateSalesEntries do
  use Ecto.Migration

  def change do
    create table(:sales_entries) do
      add :description, :string
      add :gross_price, :float
      add :net_price, :float
      add :quantity, :float
      add :vat_price, :float
      add :vat_type, :integer
      add :company_id, references(:company, on_delete: :nothing)
      add :gl_account_id, references(:gl_account, on_delete: :nothing)
      add :product_id, references(:product, on_delete: :nothing)
      add :sale_invoice_id, references(:sales_invoice, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:sales_entries, [:company_id])
    create index(:sales_entries, [:gl_account_id])
    create index(:sales_entries, [:product_id])
    create index(:sales_entries, [:sale_invoice_id])
    create index(:sales_entries, [:user_id])
  end
end
