defmodule MooseApiWeb.CreditNoteControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Journals
  alias MooseApi.Journals.CreditNote

  @create_attrs %{credit_note_number: "some credit_note_number", invoice_date: ~D[2010-04-17], notes: "some notes"}
  @update_attrs %{credit_note_number: "some updated credit_note_number", invoice_date: ~D[2011-05-18], notes: "some updated notes"}
  @invalid_attrs %{credit_note_number: nil, invoice_date: nil, notes: nil}

  def fixture(:credit_note) do
    {:ok, credit_note} = Journals.create_credit_note(@create_attrs)
    credit_note
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credit_note", %{conn: conn} do
      conn = get conn, credit_note_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credit_note" do
    test "renders credit_note when data is valid", %{conn: conn} do
      conn = post conn, credit_note_path(conn, :create), credit_note: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, credit_note_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "credit_note_number" => "some credit_note_number",
        "invoice_date" => ~D[2010-04-17],
        "notes" => "some notes"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, credit_note_path(conn, :create), credit_note: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credit_note" do
    setup [:create_credit_note]

    test "renders credit_note when data is valid", %{conn: conn, credit_note: %CreditNote{id: id} = credit_note} do
      conn = put conn, credit_note_path(conn, :update, credit_note), credit_note: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, credit_note_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "credit_note_number" => "some updated credit_note_number",
        "invoice_date" => ~D[2011-05-18],
        "notes" => "some updated notes"}
    end

    test "renders errors when data is invalid", %{conn: conn, credit_note: credit_note} do
      conn = put conn, credit_note_path(conn, :update, credit_note), credit_note: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credit_note" do
    setup [:create_credit_note]

    test "deletes chosen credit_note", %{conn: conn, credit_note: credit_note} do
      conn = delete conn, credit_note_path(conn, :delete, credit_note)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, credit_note_path(conn, :show, credit_note)
      end
    end
  end

  defp create_credit_note(_) do
    credit_note = fixture(:credit_note)
    {:ok, credit_note: credit_note}
  end
end
