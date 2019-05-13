defmodule MooseApiWeb.SalesEntriesControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.SalesEntries

  @create_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_price: 120.5, vat_type: 42}
  @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_price: 456.7, vat_type: 43}
  @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_price: nil, vat_type: nil}

  def fixture(:sales_entries) do
    {:ok, sales_entries} = Journals.create_sales_entries(@create_attrs)
    sales_entries
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sales_entries", %{conn: conn} do
      conn = get conn, sales_entries_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sales_entries" do
    test "renders sales_entries when data is valid", %{conn: conn} do
      conn = post conn, sales_entries_path(conn, :create), sales_entries: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, sales_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "gross_price" => 120.5,
        "net_price" => 120.5,
        "quantity" => 120.5,
        "vat_price" => 120.5,
        "vat_type" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sales_entries_path(conn, :create), sales_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sales_entries" do
    setup [:create_sales_entries]

    test "renders sales_entries when data is valid", %{conn: conn, sales_entries: %SalesEntries{id: id} = sales_entries} do
      conn = put conn, sales_entries_path(conn, :update, sales_entries), sales_entries: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, sales_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "gross_price" => 456.7,
        "net_price" => 456.7,
        "quantity" => 456.7,
        "vat_price" => 456.7,
        "vat_type" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, sales_entries: sales_entries} do
      conn = put conn, sales_entries_path(conn, :update, sales_entries), sales_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sales_entries" do
    setup [:create_sales_entries]

    test "deletes chosen sales_entries", %{conn: conn, sales_entries: sales_entries} do
      conn = delete conn, sales_entries_path(conn, :delete, sales_entries)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, sales_entries_path(conn, :show, sales_entries)
      end
    end
  end

  defp create_sales_entries(_) do
    sales_entries = fixture(:sales_entries)
    {:ok, sales_entries: sales_entries}
  end
end
