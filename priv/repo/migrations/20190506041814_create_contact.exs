defmodule MooseApi.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contact) do
      add :first_name, :string
      add :last_name, :string
      add :address_one, :string
      add :address_two, :string
      add :city, :string
      add :state, :string
      add :zipcode, :string
      add :contact_number, :string
      add :website, :string
      add :email, :string
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:contact, [:user_id])
    create index(:contact, [:company_id])
  end
end
