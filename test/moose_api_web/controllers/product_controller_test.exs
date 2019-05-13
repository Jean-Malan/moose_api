defmodule MooseApiWeb.ProductControllerTest do
  use MooseApiWeb.ConnCase

  alias MooseApi.Products
  alias MooseApi.Products.Product

  @create_attrs %{brand: "some brand", code: "some code", company_id: 42, current_stock: 120.5, gross_price: 120.5, opening_stock: 120.5, product_name: "some product_name", quantity: 120.5, tag: "some tag"}
  @update_attrs %{brand: "some updated brand", code: "some updated code", company_id: 43, current_stock: 456.7, gross_price: 456.7, opening_stock: 456.7, product_name: "some updated product_name", quantity: 456.7, tag: "some updated tag"}
  @invalid_attrs %{brand: nil, code: nil, company_id: nil, current_stock: nil, gross_price: nil, opening_stock: nil, product_name: nil, quantity: nil, tag: nil}

  def fixture(:product) do
    {:ok, product} = Products.create_product(@create_attrs)
    product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all product", %{conn: conn} do
      conn = get conn, product_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post conn, product_path(conn, :create), product: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, product_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "brand" => "some brand",
        "code" => "some code",
        "company_id" => 42,
        "current_stock" => 120.5,
        "gross_price" => 120.5,
        "opening_stock" => 120.5,
        "product_name" => "some product_name",
        "quantity" => 120.5,
        "tag" => "some tag"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, product_path(conn, :create), product: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put conn, product_path(conn, :update, product), product: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, product_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "brand" => "some updated brand",
        "code" => "some updated code",
        "company_id" => 43,
        "current_stock" => 456.7,
        "gross_price" => 456.7,
        "opening_stock" => 456.7,
        "product_name" => "some updated product_name",
        "quantity" => 456.7,
        "tag" => "some updated tag"}
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put conn, product_path(conn, :update, product), product: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete conn, product_path(conn, :delete, product)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, product_path(conn, :show, product)
      end
    end
  end

  defp create_product(_) do
    product = fixture(:product)
    {:ok, product: product}
  end
end
