defmodule MooseApiWeb.GeneralJournalEntriesView do
  use MooseApiWeb, :view
  alias MooseApiWeb.GeneralJournalEntriesView

  def render("index.json", %{general_journal_entries: general_journal_entries}) do
    %{data: render_many(general_journal_entries, GeneralJournalEntriesView, "general_journal_entries.json")}
  end

  def render("show.json", %{general_journal_entries: general_journal_entries}) do
    %{data: render_one(general_journal_entries, GeneralJournalEntriesView, "general_journal_entries.json")}
  end

  def render("general_journal_entries.json", %{general_journal_entries: general_journal_entries}) do
    %{id: general_journal_entries.id,
      description: general_journal_entries.description,
      gross_amount: general_journal_entries.gross_amount,
      net_amount: general_journal_entries.net_amount,
      transaction_type: general_journal_entries.transaction_type,
      vat_amount: general_journal_entries.vat_amount}
  end
end
