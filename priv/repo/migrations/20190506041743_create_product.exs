defmodule MooseApi.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :code, :string
      add :current_stock, :float
      add :brand, :string
      add :gross_price, :float
      add :opening_stock, :float
      add :product_name, :string
      add :tag, :string
      add :quantity, :float
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:product, [:user_id])
    create index(:product, [:company_id])
  end
end
