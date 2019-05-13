defmodule MooseApiWeb.GlAccountControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Account
  alias MooseApi.Account.GlAccount

  @create_attrs %{account_code: "some account_code", account_type: 42, title: "some title"}
  @update_attrs %{account_code: "some updated account_code", account_type: 43, title: "some updated title"}
  @invalid_attrs %{account_code: nil, account_type: nil, title: nil}

  def fixture(:gl_account) do
    {:ok, gl_account} = Account.create_gl_account(@create_attrs)
    gl_account
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all gl_account", %{conn: conn} do
      conn = get conn, gl_account_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create gl_account" do
    test "renders gl_account when data is valid", %{conn: conn} do
      conn = post conn, gl_account_path(conn, :create), gl_account: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, gl_account_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "account_code" => "some account_code",
        "account_type" => 42,
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, gl_account_path(conn, :create), gl_account: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update gl_account" do
    setup [:create_gl_account]

    test "renders gl_account when data is valid", %{conn: conn, gl_account: %GlAccount{id: id} = gl_account} do
      conn = put conn, gl_account_path(conn, :update, gl_account), gl_account: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, gl_account_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "account_code" => "some updated account_code",
        "account_type" => 43,
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, gl_account: gl_account} do
      conn = put conn, gl_account_path(conn, :update, gl_account), gl_account: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete gl_account" do
    setup [:create_gl_account]

    test "deletes chosen gl_account", %{conn: conn, gl_account: gl_account} do
      conn = delete conn, gl_account_path(conn, :delete, gl_account)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, gl_account_path(conn, :show, gl_account)
      end
    end
  end

  defp create_gl_account(_) do
    gl_account = fixture(:gl_account)
    {:ok, gl_account: gl_account}
  end
end
