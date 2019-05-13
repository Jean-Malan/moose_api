defmodule MooseApiWeb.BankAccountControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Account
  alias MooseApi.Account.BankAccount

  @create_attrs %{opening_balance: 120.5, title: "some title"}
  @update_attrs %{opening_balance: 456.7, title: "some updated title"}
  @invalid_attrs %{opening_balance: nil, title: nil}

  def fixture(:bank_account) do
    {:ok, bank_account} = Account.create_bank_account(@create_attrs)
    bank_account
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bank_account", %{conn: conn} do
      conn = get conn, bank_account_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bank_account" do
    test "renders bank_account when data is valid", %{conn: conn} do
      conn = post conn, bank_account_path(conn, :create), bank_account: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, bank_account_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "opening_balance" => 120.5,
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bank_account_path(conn, :create), bank_account: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bank_account" do
    setup [:create_bank_account]

    test "renders bank_account when data is valid", %{conn: conn, bank_account: %BankAccount{id: id} = bank_account} do
      conn = put conn, bank_account_path(conn, :update, bank_account), bank_account: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, bank_account_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "opening_balance" => 456.7,
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, bank_account: bank_account} do
      conn = put conn, bank_account_path(conn, :update, bank_account), bank_account: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bank_account" do
    setup [:create_bank_account]

    test "deletes chosen bank_account", %{conn: conn, bank_account: bank_account} do
      conn = delete conn, bank_account_path(conn, :delete, bank_account)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, bank_account_path(conn, :show, bank_account)
      end
    end
  end

  defp create_bank_account(_) do
    bank_account = fixture(:bank_account)
    {:ok, bank_account: bank_account}
  end
end
