defmodule MooseApi.Repo.Migrations.ChangeSalesInvoiceNaming do
  use Ecto.Migration

  def change do
    alter table(:sales_entries) do
      remove :sale_invoice_id
      add :sales_invoice_id, references(:sales_invoice, on_delete: :nothing)
    end
  end
end
