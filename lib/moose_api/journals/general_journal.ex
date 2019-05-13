defmodule MooseApi.Journals.GeneralJournal do
  use Ecto.Schema
  import Ecto.Changeset


  schema "general_journal" do
    field :description, :string
    field :journal_date, :naive_datetime
    field :journal_reference, :string
    field :user_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(general_journal, attrs) do
    general_journal
    |> cast(attrs, [:description, :journal_date, :journal_reference])
    |> validate_required([:description, :journal_date, :journal_reference])
  end
end
