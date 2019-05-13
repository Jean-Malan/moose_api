defmodule MooseApi.Repo.Migrations.CreateGeneralJournal do
  use Ecto.Migration

  def change do
    create table(:general_journal) do
      add :description, :text
      add :journal_date, :naive_datetime
      add :journal_reference, :string
      add :user_id, references(:user, on_delete: :nothing)
      add :company_id, references(:company, on_delete: :nothing)

      timestamps()
    end

    create index(:general_journal, [:user_id])
    create index(:general_journal, [:company_id])
  end
end
