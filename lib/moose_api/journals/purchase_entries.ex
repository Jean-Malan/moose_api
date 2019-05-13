defmodule MooseApi.Journals.PurchaseEntries do
  use Ecto.Schema
  import Ecto.Changeset


  schema "purchases_entries" do
    field :description, :string
    field :gross_price, :float
    field :net_price, :float
    field :quantity, :float
    field :vat_price, :float
    field :vat_type, :integer
    field :company_id, :id
    field :gl_account_id, :id
    field :product_id, :id
    field :purchase_invoice_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(purchase_entries, attrs) do
    purchase_entries
    |> cast(attrs, [:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type])
    |> validate_required([:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type])
  end
end
