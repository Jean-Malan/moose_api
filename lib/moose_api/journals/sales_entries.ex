defmodule MooseApi.Journals.SalesEntries do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sales_entries" do
    field :description, :string
    field :gross_price, :float
    field :net_price, :float
    field :quantity, :float
    field :vat_price, :float
    field :vat_type, :integer
    field :company_id, :id
    field :gl_account_id, :id
    field :product_id, :id
    field :sale_invoice_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(sales_entries, attrs) do
    sales_entries
    |> cast(attrs, [:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type])
    |> validate_required([:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type])
  end
end
