defmodule MooseApiWeb.GeneralJournalControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.GeneralJournal

  @create_attrs %{description: "some description", journal_date: ~N[2010-04-17 14:00:00.000000], journal_reference: "some journal_reference"}
  @update_attrs %{description: "some updated description", journal_date: ~N[2011-05-18 15:01:01.000000], journal_reference: "some updated journal_reference"}
  @invalid_attrs %{description: nil, journal_date: nil, journal_reference: nil}

  def fixture(:general_journal) do
    {:ok, general_journal} = Journals.create_general_journal(@create_attrs)
    general_journal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all general_journal", %{conn: conn} do
      conn = get conn, general_journal_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create general_journal" do
    test "renders general_journal when data is valid", %{conn: conn} do
      conn = post conn, general_journal_path(conn, :create), general_journal: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, general_journal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "journal_date" => ~N[2010-04-17 14:00:00.000000],
        "journal_reference" => "some journal_reference"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, general_journal_path(conn, :create), general_journal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update general_journal" do
    setup [:create_general_journal]

    test "renders general_journal when data is valid", %{conn: conn, general_journal: %GeneralJournal{id: id} = general_journal} do
      conn = put conn, general_journal_path(conn, :update, general_journal), general_journal: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, general_journal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "journal_date" => ~N[2011-05-18 15:01:01.000000],
        "journal_reference" => "some updated journal_reference"}
    end

    test "renders errors when data is invalid", %{conn: conn, general_journal: general_journal} do
      conn = put conn, general_journal_path(conn, :update, general_journal), general_journal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete general_journal" do
    setup [:create_general_journal]

    test "deletes chosen general_journal", %{conn: conn, general_journal: general_journal} do
      conn = delete conn, general_journal_path(conn, :delete, general_journal)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, general_journal_path(conn, :show, general_journal)
      end
    end
  end

  defp create_general_journal(_) do
    general_journal = fixture(:general_journal)
    {:ok, general_journal: general_journal}
  end
end
