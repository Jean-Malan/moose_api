defmodule MooseApi.Account.GlAccount do
  use Ecto.Schema
  import Ecto.Changeset


  schema "gl_account" do
    field :account_code, :string
    field :account_type, :integer
    field :title, :string
    field :user_id, :id
    field :company_id, :id
    # belongs_to :user, MooseApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(gl_account, attrs) do
    gl_account
    |> cast(attrs, [:title, :account_code, :account_type])
    |> validate_required([:title, :account_code, :account_type])
  end
end
