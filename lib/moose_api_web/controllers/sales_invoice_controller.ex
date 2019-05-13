defmodule MooseApiWeb.SalesInvoiceController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.SalesInvoice

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    sales_invoice = Journals.list_sales_invoice()
    render(conn, "index.json", sales_invoice: sales_invoice)
  end

  def create(conn, %{"sales_invoice" => sales_invoice_params}) do
    with {:ok, %SalesInvoice{} = sales_invoice} <- Journals.create_sales_invoice(sales_invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sales_invoice_path(conn, :show, sales_invoice))
      |> render("show.json", sales_invoice: sales_invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    sales_invoice = Journals.get_sales_invoice!(id)
    render(conn, "show.json", sales_invoice: sales_invoice)
  end

  def update(conn, %{"id" => id, "sales_invoice" => sales_invoice_params}) do
    sales_invoice = Journals.get_sales_invoice!(id)

    with {:ok, %SalesInvoice{} = sales_invoice} <- Journals.update_sales_invoice(sales_invoice, sales_invoice_params) do
      render(conn, "show.json", sales_invoice: sales_invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    sales_invoice = Journals.get_sales_invoice!(id)
    with {:ok, %SalesInvoice{}} <- Journals.delete_sales_invoice(sales_invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
