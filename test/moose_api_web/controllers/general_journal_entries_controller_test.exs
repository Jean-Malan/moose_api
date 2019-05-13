defmodule MooseApiWeb.GeneralJournalEntriesControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.GeneralJournalEntries

  @create_attrs %{description: "some description", gross_amount: 120.5, net_amount: 120.5, transaction_type: 42, vat_amount: 120.5}
  @update_attrs %{description: "some updated description", gross_amount: 456.7, net_amount: 456.7, transaction_type: 43, vat_amount: 456.7}
  @invalid_attrs %{description: nil, gross_amount: nil, net_amount: nil, transaction_type: nil, vat_amount: nil}

  def fixture(:general_journal_entries) do
    {:ok, general_journal_entries} = Journals.create_general_journal_entries(@create_attrs)
    general_journal_entries
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all general_journal_entries", %{conn: conn} do
      conn = get conn, general_journal_entries_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create general_journal_entries" do
    test "renders general_journal_entries when data is valid", %{conn: conn} do
      conn = post conn, general_journal_entries_path(conn, :create), general_journal_entries: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, general_journal_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "gross_amount" => 120.5,
        "net_amount" => 120.5,
        "transaction_type" => 42,
        "vat_amount" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, general_journal_entries_path(conn, :create), general_journal_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update general_journal_entries" do
    setup [:create_general_journal_entries]

    test "renders general_journal_entries when data is valid", %{conn: conn, general_journal_entries: %GeneralJournalEntries{id: id} = general_journal_entries} do
      conn = put conn, general_journal_entries_path(conn, :update, general_journal_entries), general_journal_entries: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, general_journal_entries_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "gross_amount" => 456.7,
        "net_amount" => 456.7,
        "transaction_type" => 43,
        "vat_amount" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, general_journal_entries: general_journal_entries} do
      conn = put conn, general_journal_entries_path(conn, :update, general_journal_entries), general_journal_entries: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete general_journal_entries" do
    setup [:create_general_journal_entries]

    test "deletes chosen general_journal_entries", %{conn: conn, general_journal_entries: general_journal_entries} do
      conn = delete conn, general_journal_entries_path(conn, :delete, general_journal_entries)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, general_journal_entries_path(conn, :show, general_journal_entries)
      end
    end
  end

  defp create_general_journal_entries(_) do
    general_journal_entries = fixture(:general_journal_entries)
    {:ok, general_journal_entries: general_journal_entries}
  end
end
