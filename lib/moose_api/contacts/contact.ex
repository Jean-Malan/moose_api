defmodule MooseApi.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contact" do
    field :address_one, :string
    field :address_two, :string
    field :city, :string
    field :contact_number, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :state, :string
    field :website, :string
    field :zipcode, :string
    field :company_id, :id

    belongs_to :user, MooseApi.Accounts.User
    has_many :sales_invoice, MooseApi.Journals.SalesInvoice
    

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:first_name, :last_name, :user_id, :address_one, :address_two, :city, :state, :zipcode, :contact_number, :website, :email])
    |> validate_required([])
  end
end
