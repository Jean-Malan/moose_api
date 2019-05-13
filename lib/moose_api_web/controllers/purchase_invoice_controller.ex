defmodule MooseApiWeb.PurchaseInvoiceController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.PurchaseInvoice

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    purchase_invoice = Journals.list_purchase_invoice()
    render(conn, "index.json", purchase_invoice: purchase_invoice)
  end

  def create(conn, %{"purchase_invoice" => purchase_invoice_params}) do
    with {:ok, %PurchaseInvoice{} = purchase_invoice} <- Journals.create_purchase_invoice(purchase_invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", purchase_invoice_path(conn, :show, purchase_invoice))
      |> render("show.json", purchase_invoice: purchase_invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase_invoice = Journals.get_purchase_invoice!(id)
    render(conn, "show.json", purchase_invoice: purchase_invoice)
  end

  def update(conn, %{"id" => id, "purchase_invoice" => purchase_invoice_params}) do
    purchase_invoice = Journals.get_purchase_invoice!(id)

    with {:ok, %PurchaseInvoice{} = purchase_invoice} <- Journals.update_purchase_invoice(purchase_invoice, purchase_invoice_params) do
      render(conn, "show.json", purchase_invoice: purchase_invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase_invoice = Journals.get_purchase_invoice!(id)
    with {:ok, %PurchaseInvoice{}} <- Journals.delete_purchase_invoice(purchase_invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
