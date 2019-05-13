defmodule MooseApiWeb.PurchaseEntriesController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.PurchaseEntries

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    purchases_entries = Journals.list_purchases_entries()
    render(conn, "index.json", purchases_entries: purchases_entries)
  end

  def create(conn, %{"purchase_entries" => purchase_entries_params}) do
    with {:ok, %PurchaseEntries{} = purchase_entries} <- Journals.create_purchase_entries(purchase_entries_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", purchase_entries_path(conn, :show, purchase_entries))
      |> render("show.json", purchase_entries: purchase_entries)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase_entries = Journals.get_purchase_entries!(id)
    render(conn, "show.json", purchase_entries: purchase_entries)
  end

  def update(conn, %{"id" => id, "purchase_entries" => purchase_entries_params}) do
    purchase_entries = Journals.get_purchase_entries!(id)

    with {:ok, %PurchaseEntries{} = purchase_entries} <- Journals.update_purchase_entries(purchase_entries, purchase_entries_params) do
      render(conn, "show.json", purchase_entries: purchase_entries)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase_entries = Journals.get_purchase_entries!(id)
    with {:ok, %PurchaseEntries{}} <- Journals.delete_purchase_entries(purchase_entries) do
      send_resp(conn, :no_content, "")
    end
  end
end
