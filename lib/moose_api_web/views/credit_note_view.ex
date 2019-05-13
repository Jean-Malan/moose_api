defmodule MooseApiWeb.CreditNoteView do
  use MooseApiWeb, :view
  alias MooseApiWeb.CreditNoteView

  def render("index.json", %{credit_note: credit_note}) do
    %{data: render_many(credit_note, CreditNoteView, "credit_note.json")}
  end

  def render("show.json", %{credit_note: credit_note}) do
    %{data: render_one(credit_note, CreditNoteView, "credit_note.json")}
  end

  def render("credit_note.json", %{credit_note: credit_note}) do
    %{id: credit_note.id,
      credit_note_number: credit_note.credit_note_number,
      invoice_date: credit_note.invoice_date,
      notes: credit_note.notes}
  end
end
