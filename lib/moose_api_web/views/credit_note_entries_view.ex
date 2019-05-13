defmodule MooseApiWeb.CreditNoteEntriesView do
  use MooseApiWeb, :view
  alias MooseApiWeb.CreditNoteEntriesView

  def render("index.json", %{credit_note_entries: credit_note_entries}) do
    %{data: render_many(credit_note_entries, CreditNoteEntriesView, "credit_note_entries.json")}
  end

  def render("show.json", %{credit_note_entries: credit_note_entries}) do
    %{data: render_one(credit_note_entries, CreditNoteEntriesView, "credit_note_entries.json")}
  end

  def render("credit_note_entries.json", %{credit_note_entries: credit_note_entries}) do
    %{id: credit_note_entries.id,
      description: credit_note_entries.description,
      quantity: credit_note_entries.quantity,
      net_price: credit_note_entries.net_price,
      vat_type: credit_note_entries.vat_type,
      gross_price: credit_note_entries.gross_price,
      vat_amount: credit_note_entries.vat_amount}
  end
end
