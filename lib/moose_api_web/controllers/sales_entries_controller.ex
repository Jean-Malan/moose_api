defmodule MooseApiWeb.SalesEntriesController do
  use MooseApiWeb, :controller

  alias MooseApi.Journals
  alias MooseApi.Journals.SalesEntries

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    sales_entries = Journals.list_sales_entries()
    render(conn, "index.json", sales_entries: sales_entries)
  end

  def create(conn, %{"sales_entries" => sales_entries_params}) do
    with {:ok, %SalesEntries{} = sales_entries} <- Journals.create_sales_entries(sales_entries_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sales_entries_path(conn, :show, sales_entries))
      |> render("show.json", sales_entries: sales_entries)
    end
  end

  def show(conn, %{"id" => id}) do
    sales_entries = Journals.get_sales_entries!(id)
    render(conn, "show.json", sales_entries: sales_entries)
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
