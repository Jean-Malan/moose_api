defmodule MooseApiWeb.GeneralJournalView do
  use MooseApiWeb, :view
  alias MooseApiWeb.GeneralJournalView

  def render("index.json", %{general_journal: general_journal}) do
    %{data: render_many(general_journal, GeneralJournalView, "general_journal.json")}
  end

  def render("show.json", %{general_journal: general_journal}) do
    %{data: render_one(general_journal, GeneralJournalView, "general_journal.json")}
  end

  def render("general_journal.json", %{general_journal: general_journal}) do
    %{id: general_journal.id,
      description: general_journal.description,
      journal_date: general_journal.journal_date,
      journal_reference: general_journal.journal_reference}
  end
end
