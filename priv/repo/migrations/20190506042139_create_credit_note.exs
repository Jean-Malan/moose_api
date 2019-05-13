defmodule MooseApi.Repo.Migrations.CreateCreditNote do
  use Ecto.Migration

  def change do
    create table(:credit_note) do
      add :credit_note_number, :string
      add :invoice_date, :date
      add :notes, :text
      add :contact_id, references(:contact, on_delete: :nothing)
      add :user_id, references(:user, on_delete: :nothing)
      add :sales_invoice_id, references(:sales_invoice, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:credit_note, [:contact_id])
    create index(:credit_note, [:user_id])
    create index(:credit_note, [:sales_invoice_id])
    create index(:credit_note, [:company_id])
  end
end
