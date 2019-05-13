defmodule MooseApi.Journals.GeneralJournalEntries do
  use Ecto.Schema
  import Ecto.Changeset


  schema "general_journal_entries" do
    field :description, :string
    field :gross_amount, :float
    field :net_amount, :float
    field :transaction_type, :integer
    field :vat_amount, :float
    field :gl_account_id, :id
    field :general_journal_id, :id
    field :product_id, :id
    field :user_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(general_journal_entries, attrs) do
    general_journal_entries
    |> cast(attrs, [:description, :gross_amount, :net_amount, :transaction_type, :vat_amount])
    |> validate_required([:description, :gross_amount, :net_amount, :transaction_type, :vat_amount])
  end
end
