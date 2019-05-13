defmodule MooseApiWeb.SalesInvoiceControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.SalesInvoice

  @create_attrs %{id: 42, invoice_date: ~D[2010-04-17], invoice_number: "some invoice_number", notes: "some notes"}
  @update_attrs %{id: 43, invoice_date: ~D[2011-05-18], invoice_number: "some updated invoice_number", notes: "some updated notes"}
  @invalid_attrs %{id: nil, invoice_date: nil, invoice_number: nil, notes: nil}

  def fixture(:sales_invoice) do
    {:ok, sales_invoice} = Journals.create_sales_invoice(@create_attrs)
    sales_invoice
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sales_invoice", %{conn: conn} do
      conn = get conn, sales_invoice_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sales_invoice" do
    test "renders sales_invoice when data is valid", %{conn: conn} do
      conn = post conn, sales_invoice_path(conn, :create), sales_invoice: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, sales_invoice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id" => 42,
        "invoice_date" => ~D[2010-04-17],
        "invoice_number" => "some invoice_number",
        "notes" => "some notes"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sales_invoice_path(conn, :create), sales_invoice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sales_invoice" do
    setup [:create_sales_invoice]

    test "renders sales_invoice when data is valid", %{conn: conn, sales_invoice: %SalesInvoice{id: id} = sales_invoice} do
      conn = put conn, sales_invoice_path(conn, :update, sales_invoice), sales_invoice: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, sales_invoice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "id" => 43,
        "invoice_date" => ~D[2011-05-18],
        "invoice_number" => "some updated invoice_number",
        "notes" => "some updated notes"}
    end

    test "renders errors when data is invalid", %{conn: conn, sales_invoice: sales_invoice} do
      conn = put conn, sales_invoice_path(conn, :update, sales_invoice), sales_invoice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sales_invoice" do
    setup [:create_sales_invoice]

    test "deletes chosen sales_invoice", %{conn: conn, sales_invoice: sales_invoice} do
      conn = delete conn, sales_invoice_path(conn, :delete, sales_invoice)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, sales_invoice_path(conn, :show, sales_invoice)
      end
    end
  end

  defp create_sales_invoice(_) do
    sales_invoice = fixture(:sales_invoice)
    {:ok, sales_invoice: sales_invoice}
  end
end
