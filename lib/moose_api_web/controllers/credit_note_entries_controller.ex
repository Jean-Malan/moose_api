defmodule MooseApiWeb.CreditNoteEntriesController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.CreditNoteEntries

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    credit_note_entries = Journals.list_credit_note_entries()
    render(conn, "index.json", credit_note_entries: credit_note_entries)
  end

  def create(conn, %{"credit_note_entries" => credit_note_entries_params}) do
    with {:ok, %CreditNoteEntries{} = credit_note_entries} <- Journals.create_credit_note_entries(credit_note_entries_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", credit_note_entries_path(conn, :show, credit_note_entries))
      |> render("show.json", credit_note_entries: credit_note_entries)
    end
  end

  def show(conn, %{"id" => id}) do
    credit_note_entries = Journals.get_credit_note_entries!(id)
    render(conn, "show.json", credit_note_entries: credit_note_entries)
  end

  def update(conn, %{"id" => id, "credit_note_entries" => credit_note_entries_params}) do
    credit_note_entries = Journals.get_credit_note_entries!(id)

    with {:ok, %CreditNoteEntries{} = credit_note_entries} <- Journals.update_credit_note_entries(credit_note_entries, credit_note_entries_params) do
      render(conn, "show.json", credit_note_entries: credit_note_entries)
    end
  end

  def delete(conn, %{"id" => id}) do
    credit_note_entries = Journals.get_credit_note_entries!(id)
    with {:ok, %CreditNoteEntries{}} <- Journals.delete_credit_note_entries(credit_note_entries) do
      send_resp(conn, :no_content, "")
    end
  end
end
