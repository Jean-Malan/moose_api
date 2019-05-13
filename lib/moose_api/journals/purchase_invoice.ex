defmodule MooseApi.Journals.PurchaseInvoice do
  use Ecto.Schema
  import Ecto.Changeset


  schema "purchase_invoice" do
    field :invoice_date, :date
    field :invoice_number, :string
    field :notes, :string
    field :contact_id, :id
    field :user_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(purchase_invoice, attrs) do
    purchase_invoice
    |> cast(attrs, [:invoice_number, :invoice_date, :notes])
    |> validate_required([:invoice_number, :invoice_date, :notes])
  end
end
