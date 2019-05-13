defmodule MooseApi.Journals.SalesInvoice do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sales_invoice" do
    field :invoice_date, :date
    field :invoice_number, :string
    field :notes, :string
    field :contact_id, :id
    field :user_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(sales_invoice, attrs) do
    sales_invoice
    |> cast(attrs, [:id, :invoice_number, :invoice_date, :notes])
    |> validate_required([:id, :invoice_number, :invoice_date, :notes])
  end
end
