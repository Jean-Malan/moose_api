defmodule MooseApiWeb.GeneralJournalEntriesController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.GeneralJournalEntries

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    general_journal_entries = Journals.list_general_journal_entries()
    render(conn, "index.json", general_journal_entries: general_journal_entries)
  end

  def create(conn, %{"general_journal_entries" => general_journal_entries_params}) do
    with {:ok, %GeneralJournalEntries{} = general_journal_entries} <- Journals.create_general_journal_entries(general_journal_entries_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", general_journal_entries_path(conn, :show, general_journal_entries))
      |> render("show.json", general_journal_entries: general_journal_entries)
    end
  end

  def show(conn, %{"id" => id}) do
    general_journal_entries = Journals.get_general_journal_entries!(id)
    render(conn, "show.json", general_journal_entries: general_journal_entries)
  end

  def update(conn, %{"id" => id, "general_journal_entries" => general_journal_entries_params}) do
    general_journal_entries = Journals.get_general_journal_entries!(id)

    with {:ok, %GeneralJournalEntries{} = general_journal_entries} <- Journals.update_general_journal_entries(general_journal_entries, general_journal_entries_params) do
      render(conn, "show.json", general_journal_entries: general_journal_entries)
    end
  end

  def delete(conn, %{"id" => id}) do
    general_journal_entries = Journals.get_general_journal_entries!(id)
    with {:ok, %GeneralJournalEntries{}} <- Journals.delete_general_journal_entries(general_journal_entries) do
      send_resp(conn, :no_content, "")
    end
  end
end
