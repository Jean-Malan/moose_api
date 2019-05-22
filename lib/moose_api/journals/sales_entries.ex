defmodule MooseApi.Journals.SalesEntries do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [ :description, :gross_price, :net_price, :quantity, :vat_price, :vat_type, :company_id, :gl_account_id, :product_id]}
  
  schema "sales_entries" do
    field :description, :string
    field :gross_price, :float
    field :net_price, :float
    field :quantity, :float
    field :vat_price, :float
    field :vat_type, VatType
    field :company_id, :id
    field :gl_account_id, :id
    field :product_id, :id
    # field :sales_invoice_id, :id
    # field :user_id, :id

    belongs_to :user, MooseApi.Accounts.User
    belongs_to :sales_invoice, MooseApi.Journals.SalesInvoice

    timestamps()
  end

  @doc false
  def changeset(sales_entries, attrs) do
    sales_entries
    |> cast(attrs, [:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type, :sales_invoice_id, :user_id])
    |> validate_required([:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type])
  end
end
