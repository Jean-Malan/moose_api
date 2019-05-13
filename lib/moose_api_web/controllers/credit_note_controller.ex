defmodule MooseApiWeb.CreditNoteController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.CreditNote

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    credit_note = Journals.list_credit_note()
    render(conn, "index.json", credit_note: credit_note)
  end

  def create(conn, %{"credit_note" => credit_note_params}) do
    with {:ok, %CreditNote{} = credit_note} <- Journals.create_credit_note(credit_note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", credit_note_path(conn, :show, credit_note))
      |> render("show.json", credit_note: credit_note)
    end
  end

  def show(conn, %{"id" => id}) do
    credit_note = Journals.get_credit_note!(id)
    render(conn, "show.json", credit_note: credit_note)
  end

  def update(conn, %{"id" => id, "credit_note" => credit_note_params}) do
    credit_note = Journals.get_credit_note!(id)

    with {:ok, %CreditNote{} = credit_note} <- Journals.update_credit_note(credit_note, credit_note_params) do
      render(conn, "show.json", credit_note: credit_note)
    end
  end

  def delete(conn, %{"id" => id}) do
    credit_note = Journals.get_credit_note!(id)
    with {:ok, %CreditNote{}} <- Journals.delete_credit_note(credit_note) do
      send_resp(conn, :no_content, "")
    end
  end
end
