defmodule MooseApiWeb.PurchaseEntriesControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.PurchaseEntries

  @create_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_price: 120.5, vat_type: 42}
  @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_price: 456.7, vat_type: 43}
  @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_price: nil, vat_type: nil}

  def fixture(:purchase_entries) do
    {:ok, purchase_entries} = Journals.create_purchase_entries(@create_attrs)
    purchase_entries
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all purchases_entries", %{conn: conn} do
      conn = get conn, purchase_entries_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create purchase_entries" do
    test "renders purchase_entries when data is valid", %{conn: conn} do
      conn = post conn, purchase_entries_path(conn, :create), purchase_entries: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, purchase_entries_path(conn, :show, id)
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
      conn = post conn, purchase_entries_path(conn, :create), purchase_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update purchase_entries" do
    setup [:create_purchase_entries]

    test "renders purchase_entries when data is valid", %{conn: conn, purchase_entries: %PurchaseEntries{id: id} = purchase_entries} do
      conn = put conn, purchase_entries_path(conn, :update, purchase_entries), purchase_entries: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, purchase_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "gross_price" => 456.7,
        "net_price" => 456.7,
        "quantity" => 456.7,
        "vat_price" => 456.7,
        "vat_type" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, purchase_entries: purchase_entries} do
      conn = put conn, purchase_entries_path(conn, :update, purchase_entries), purchase_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete purchase_entries" do
    setup [:create_purchase_entries]

    test "deletes chosen purchase_entries", %{conn: conn, purchase_entries: purchase_entries} do
      conn = delete conn, purchase_entries_path(conn, :delete, purchase_entries)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, purchase_entries_path(conn, :show, purchase_entries)
      end
    end
  end

  defp create_purchase_entries(_) do
    purchase_entries = fixture(:purchase_entries)
    {:ok, purchase_entries: purchase_entries}
  end
end
