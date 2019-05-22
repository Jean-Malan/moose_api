defmodule MooseApiWeb.SalesEntriesController do
  use MooseApiWeb, :controller
  alias MooseApi.Repo
  alias MooseApi.Journals
  alias MooseApi.Journals.SalesEntries

  action_fallback MooseApiWeb.FallbackController


  def index(conn, %{"type" => "sales_entries", "invoice_id" => id}) do
    sales_entries = Journals.list_sales_entries_by_invoice_id(id)
    # |> Repo.preload(:sales_invoice)
    render(conn, "index.json", data: sales_entries)
  end

  def index(conn, _params) do
    sales_entries = Journals.list_sales_entries()
    |> Repo.preload(:sales_invoice)
    render(conn, "index.json", data: sales_entries)
  end


  # def create(conn, %{"sales_entries" => sales_entries_params}) do
  def create(conn, %{"type" => "sales_entries", "data" => %{"attributes" => sales_entries_params}}) do
      # get current user id
    current_user = Guardian.Plug.current_resource(conn)
    current_user_id = current_user.id

    # combine sales_invoice_params with current user id
    params =
      Map.put(sales_entries_params, "user_id", current_user_id)


    with {:ok, %SalesEntries{} = sales_entries} <- Journals.create_sales_entries(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sales_entries_path(conn, :show, sales_entries))
      |> render("show.json", data: sales_entries)
    end
  end

  def show(conn, %{"id" => id}) do
    sales_entries = Journals.get_sales_entries!(id)
    render(conn, "show.json", data: sales_entries)
  end

  def update(conn, %{"id" => id, "sales_entries" => sales_entries_params}) do
    sales_entries = Journals.get_sales_entries!(id)

    with {:ok, %SalesEntries{} = sales_entries} <- Journals.update_sales_entries(sales_entries, sales_entries_params) do
      render(conn, "show.json", sales_entries: sales_entries)
    end
  end

  def delete(conn, %{"id" => id}) do
    sales_entries = Journals.get_sales_entries!(id)
    with {:ok, %SalesEntries{}} <- Journals.delete_sales_entries(sales_entries) do
      send_resp(conn, :no_content, "")
    end
  end
end
