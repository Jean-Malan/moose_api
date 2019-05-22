defmodule MooseApi.Journals.SalesInvoice do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [ :id, :invoice_number, :invoice_date, :notes, :contact_id, :user_id]}
  schema "sales_invoice" do
    field :invoice_date, :date
    field :invoice_number, :string
    field :notes, :string

    belongs_to :user, MooseApi.Accounts.User
    belongs_to :contact, MooseApi.Contacts.Contact
    has_many :sales_entries, MooseApi.Journals.SalesEntries
    
    timestamps()
  end

  @doc false
  def changeset(sales_invoice, attrs) do
    sales_invoice
    |> cast(attrs, [:id, :invoice_number, :invoice_date, :notes, :contact_id, :user_id])
    |> validate_required([:invoice_number, :invoice_date])
  end
end
