defmodule MooseApiWeb.PurchaseInvoiceControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.PurchaseInvoice

  @create_attrs %{invoice_date: ~D[2010-04-17], invoice_number: "some invoice_number", notes: "some notes"}
  @update_attrs %{invoice_date: ~D[2011-05-18], invoice_number: "some updated invoice_number", notes: "some updated notes"}
  @invalid_attrs %{invoice_date: nil, invoice_number: nil, notes: nil}

  def fixture(:purchase_invoice) do
    {:ok, purchase_invoice} = Journals.create_purchase_invoice(@create_attrs)
    purchase_invoice
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all purchase_invoice", %{conn: conn} do
      conn = get conn, purchase_invoice_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create purchase_invoice" do
    test "renders purchase_invoice when data is valid", %{conn: conn} do
      conn = post conn, purchase_invoice_path(conn, :create), purchase_invoice: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, purchase_invoice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "invoice_date" => ~D[2010-04-17],
        "invoice_number" => "some invoice_number",
        "notes" => "some notes"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, purchase_invoice_path(conn, :create), purchase_invoice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update purchase_invoice" do
    setup [:create_purchase_invoice]

    test "renders purchase_invoice when data is valid", %{conn: conn, purchase_invoice: %PurchaseInvoice{id: id} = purchase_invoice} do
      conn = put conn, purchase_invoice_path(conn, :update, purchase_invoice), purchase_invoice: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, purchase_invoice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "invoice_date" => ~D[2011-05-18],
        "invoice_number" => "some updated invoice_number",
        "notes" => "some updated notes"}
    end

    test "renders errors when data is invalid", %{conn: conn, purchase_invoice: purchase_invoice} do
      conn = put conn, purchase_invoice_path(conn, :update, purchase_invoice), purchase_invoice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete purchase_invoice" do
    setup [:create_purchase_invoice]

    test "deletes chosen purchase_invoice", %{conn: conn, purchase_invoice: purchase_invoice} do
      conn = delete conn, purchase_invoice_path(conn, :delete, purchase_invoice)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, purchase_invoice_path(conn, :show, purchase_invoice)
      end
    end
  end

  defp create_purchase_invoice(_) do
    purchase_invoice = fixture(:purchase_invoice)
    {:ok, purchase_invoice: purchase_invoice}
  end
end
