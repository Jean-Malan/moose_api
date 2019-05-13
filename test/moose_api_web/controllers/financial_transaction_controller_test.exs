defmodule MooseApiWeb.FinancialTransactionControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Transaction
  alias MooseApi.Transaction.FinancialTransaction

  @create_attrs %{gross_amount: 120.5, net_amount: 120.5, notes: "some notes", transaction_date: ~N[2010-04-17 14:00:00.000000], transaction_reference: "some transaction_reference", transaction_type: 42, vat_amount: 120.5, vat_type: 120.5}
  @update_attrs %{gross_amount: 456.7, net_amount: 456.7, notes: "some updated notes", transaction_date: ~N[2011-05-18 15:01:01.000000], transaction_reference: "some updated transaction_reference", transaction_type: 43, vat_amount: 456.7, vat_type: 456.7}
  @invalid_attrs %{gross_amount: nil, net_amount: nil, notes: nil, transaction_date: nil, transaction_reference: nil, transaction_type: nil, vat_amount: nil, vat_type: nil}

  def fixture(:financial_transaction) do
    {:ok, financial_transaction} = Transaction.create_financial_transaction(@create_attrs)
    financial_transaction
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all financial_transactions", %{conn: conn} do
      conn = get conn, financial_transaction_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create financial_transaction" do
    test "renders financial_transaction when data is valid", %{conn: conn} do
      conn = post conn, financial_transaction_path(conn, :create), financial_transaction: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, financial_transaction_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "gross_amount" => 120.5,
        "net_amount" => 120.5,
        "notes" => "some notes",
        "transaction_date" => ~N[2010-04-17 14:00:00.000000],
        "transaction_reference" => "some transaction_reference",
        "transaction_type" => 42,
        "vat_amount" => 120.5,
        "vat_type" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, financial_transaction_path(conn, :create), financial_transaction: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update financial_transaction" do
    setup [:create_financial_transaction]

    test "renders financial_transaction when data is valid", %{conn: conn, financial_transaction: %FinancialTransaction{id: id} = financial_transaction} do
      conn = put conn, financial_transaction_path(conn, :update, financial_transaction), financial_transaction: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, financial_transaction_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "gross_amount" => 456.7,
        "net_amount" => 456.7,
        "notes" => "some updated notes",
        "transaction_date" => ~N[2011-05-18 15:01:01.000000],
        "transaction_reference" => "some updated transaction_reference",
        "transaction_type" => 43,
        "vat_amount" => 456.7,
        "vat_type" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, financial_transaction: financial_transaction} do
      conn = put conn, financial_transaction_path(conn, :update, financial_transaction), financial_transaction: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete financial_transaction" do
    setup [:create_financial_transaction]

    test "deletes chosen financial_transaction", %{conn: conn, financial_transaction: financial_transaction} do
      conn = delete conn, financial_transaction_path(conn, :delete, financial_transaction)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, financial_transaction_path(conn, :show, financial_transaction)
      end
    end
  end

  defp create_financial_transaction(_) do
    financial_transaction = fixture(:financial_transaction)
    {:ok, financial_transaction: financial_transaction}
  end
end
