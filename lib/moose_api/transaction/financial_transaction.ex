defmodule MooseApi.Transaction.FinancialTransaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "financial_transactions" do
    field :bank_account_id, :id
    field :contact_id, :id
    field :company_id, :id
    field :gl_account_id, :id
    field :gross_amount, :float
    field :net_amount, :float
    field :notes, :string
    field :purchase_invoice_id, :id
    field :sale_invoice_id, :id
    field :transaction_date, :naive_datetime
    field :transaction_reference, :string
    field :transaction_type, :integer
    field :user_id, :id
    field :vat_amount, :float
    field :vat_type, :float

    # belongs_to :user, MooseApi.Accounts.User
    # belongs_to :credit_note, MooseApi.Journals.CreditNote
    # belongs_to :contact_id, MooseApi.Contacts.Contact
    # belongs_to :gl_account, MooseApi.Accounts.GlAccount
    # belongs_to :sales_invoice MooseApi.Journals.SalesInvoice
    # belongs_to :purchase_invoice MooseApi.Journals.PurchaseInvoice

    # belongs_to :user, MooseApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(financial_transaction, attrs) do
    financial_transaction
    |> cast(attrs, [:gross_amount, :net_amount, :notes, :transaction_reference, :transaction_date, :transaction_type, :vat_amount, :vat_type])
    |> validate_required([:gross_amount, :net_amount, :notes, :transaction_reference, :transaction_date, :transaction_type, :vat_amount, :vat_type])
  end
end
