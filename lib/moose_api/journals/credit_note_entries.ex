defmodule MooseApi.Journals.CreditNoteEntries do
  use Ecto.Schema
  import Ecto.Changeset


  schema "credit_note_entries" do
    field :description, :string
    field :gross_price, :float
    field :net_price, :float
    field :quantity, :float
    field :vat_amount, :float
    field :vat_type, :integer
    field :product_id, :id
    field :sale_invoice_id, :id
    field :gl_account_id, :id
    field :user_id, :id
    field :company_id, :id

    # belongs_to :user, MooseApi.Accounts.User
    # belongs_to :credit_note, MooseApi.Journals.CreditNote
    # belongs_to :products, MooseApi.Products.Product
    # belongs_to :gl_account, MooseApi.Accounts.GlAccount
    # belongs_to :user, MooseApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(credit_note_entries, attrs) do
    credit_note_entries
    |> cast(attrs, [:description, :quantity, :net_price, :vat_type, :gross_price, :vat_amount])
    |> validate_required([:description, :quantity, :net_price, :vat_type, :gross_price, :vat_amount])
  end
end
