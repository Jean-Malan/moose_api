defmodule MooseApi.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "product" do
    field :brand, :string
    field :code, :string
    field :current_stock, :float
    field :gross_price, :float
    field :opening_stock, :float
    field :product_name, :string
    field :quantity, :float
    field :tag, :string
    field :user_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:company_id, :code, :current_stock, :brand, :gross_price, :opening_stock, :product_name, :tag, :quantity])
    |> validate_required([:company_id, :code, :current_stock, :brand, :gross_price, :opening_stock, :product_name, :tag, :quantity])
  end
end
