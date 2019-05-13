defmodule MooseApi.Journals.CreditNote do
  use Ecto.Schema
  import Ecto.Changeset


  schema "credit_note" do
    field :credit_note_number, :string
    field :invoice_date, :date
    field :notes, :string
    field :contact_id, :id
    field :user_id, :id
    field :sales_invoice_id, :id
    field :company_id, :id

    # belongs_to :user, MooseApi.Accounts.User
    # has_many :credit_note_entries, MooseApi.Journals.CreditNoteEntries
    # belongs_to :contact_id, MooseApi.Contacts.Contact
    # belongs_to :user, MooseApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(credit_note, attrs) do
    credit_note
    |> cast(attrs, [:credit_note_number, :invoice_date, :notes])
    |> validate_required([:credit_note_number, :invoice_date, :notes])
  end
end
