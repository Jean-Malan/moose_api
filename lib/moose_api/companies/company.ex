defmodule MooseApi.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset


  schema "company" do
    field :user_id, :id
    field :tag, :string
    field :name, :string
    field :description, :string
    # belongs_to :user, MooseApi.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :description, :tag])
    |> validate_required([])
  end
end
