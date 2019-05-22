defmodule MooseApiWeb.SalesInvoiceController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Repo
  alias MooseApi.Journals.SalesInvoice

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do

    current_user = Guardian.Plug.current_resource(conn)
    current_user_id = current_user.id

    sales_invoice = Journals.list_sales_invoice(current_user_id)
    |> Repo.preload(:user)
    |> Repo.preload(:contact)
    |> Repo.preload(:sales_entries)

    # IO.inspect(sales_invoice)
    render(conn, "index.json-api", data: sales_invoice)
  end

  def create(conn, %{"type" => "sales_invoice", "data" => %{"attributes" => sales_invoice_params}}) do

    # get current user id
    current_user = Guardian.Plug.current_resource(conn)
    current_user_id = current_user.id

    # combine sales_invoice_params with current user id
    params =
      Map.put(sales_invoice_params, "user_id", current_user_id)

    with {:ok, %SalesInvoice{} = sales_invoice} <- Journals.create_sales_invoice(sales_invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sales_invoice_path(conn, :show, sales_invoice))
      |> render("show.json", sales_invoice: params)
    end
  end

  def show(conn, %{"id" => id}) do
    sales_invoice = Journals.get_sales_invoice!(id)
    |> Repo.preload(:user)
    |> Repo.preload(:contact)
    render(conn, "show.json", data: sales_invoice)
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
