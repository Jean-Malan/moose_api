defmodule MooseApiWeb.CreditNoteEntriesControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.CreditNoteEntries

  @create_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_amount: 120.5, vat_type: 42}
  @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_amount: 456.7, vat_type: 43}
  @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_amount: nil, vat_type: nil}

  def fixture(:credit_note_entries) do
    {:ok, credit_note_entries} = Journals.create_credit_note_entries(@create_attrs)
    credit_note_entries
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credit_note_entries", %{conn: conn} do
      conn = get conn, credit_note_entries_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credit_note_entries" do
    test "renders credit_note_entries when data is valid", %{conn: conn} do
      conn = post conn, credit_note_entries_path(conn, :create), credit_note_entries: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, credit_note_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "gross_price" => 120.5,
        "net_price" => 120.5,
        "quantity" => 120.5,
        "vat_amount" => 120.5,
        "vat_type" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, credit_note_entries_path(conn, :create), credit_note_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credit_note_entries" do
    setup [:create_credit_note_entries]

    test "renders credit_note_entries when data is valid", %{conn: conn, credit_note_entries: %CreditNoteEntries{id: id} = credit_note_entries} do
      conn = put conn, credit_note_entries_path(conn, :update, credit_note_entries), credit_note_entries: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, credit_note_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "gross_price" => 456.7,
        "net_price" => 456.7,
        "quantity" => 456.7,
        "vat_amount" => 456.7,
        "vat_type" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, credit_note_entries: credit_note_entries} do
      conn = put conn, credit_note_entries_path(conn, :update, credit_note_entries), credit_note_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credit_note_entries" do
    setup [:create_credit_note_entries]

    test "deletes chosen credit_note_entries", %{conn: conn, credit_note_entries: credit_note_entries} do
      conn = delete conn, credit_note_entries_path(conn, :delete, credit_note_entries)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, credit_note_entries_path(conn, :show, credit_note_entries)
      end
    end
  end

  defp create_credit_note_entries(_) do
    credit_note_entries = fixture(:credit_note_entries)
    {:ok, credit_note_entries: credit_note_entries}
  end
end
