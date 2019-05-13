defmodule MooseApi.Account.BankAccount do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bank_account" do
    field :opening_balance, :float
    field :title, :string
    field :user_id, :id
    field :company_id, :id
    # belongs_to :user, MooseApi.Accounts.User
    # belongs_to :company, MooseApi.Companies.Company

    timestamps()
  end

  @doc false
  def changeset(bank_account, attrs) do
    bank_account
    |> cast(attrs, [:title, :opening_balance])
    |> validate_required([:title, :opening_balance])
  end
end
