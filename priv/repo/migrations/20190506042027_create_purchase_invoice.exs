defmodule MooseApi.Repo.Migrations.CreatePurchaseInvoice do
  use Ecto.Migration

  def change do
    create table(:purchase_invoice) do
      add :invoice_number, :string
      add :invoice_date, :date
      add :notes, :text
      add :contact_id, references(:contact, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:purchase_invoice, [:contact_id])
    create index(:purchase_invoice, [:user_id])
    create index(:purchase_invoice, [:company_id])
  end
end
