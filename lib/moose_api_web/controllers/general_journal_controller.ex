defmodule MooseApiWeb.GeneralJournalController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.GeneralJournal

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    general_journal = Journals.list_general_journal()
    render(conn, "index.json", general_journal: general_journal)
  end

  def create(conn, %{"general_journal" => general_journal_params}) do
    with {:ok, %GeneralJournal{} = general_journal} <- Journals.create_general_journal(general_journal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", general_journal_path(conn, :show, general_journal))
      |> render("show.json", general_journal: general_journal)
    end
  end

  def show(conn, %{"id" => id}) do
    general_journal = Journals.get_general_journal!(id)
    render(conn, "show.json", general_journal: general_journal)
  end

  def update(conn, %{"id" => id, "general_journal" => general_journal_params}) do
    general_journal = Journals.get_general_journal!(id)

    with {:ok, %GeneralJournal{} = general_journal} <- Journals.update_general_journal(general_journal, general_journal_params) do
      render(conn, "show.json", general_journal: general_journal)
    end
  end

  def delete(conn, %{"id" => id}) do
    general_journal = Journals.get_general_journal!(id)
    with {:ok, %GeneralJournal{}} <- Journals.delete_general_journal(general_journal) do
      send_resp(conn, :no_content, "")
    end
  end
end
