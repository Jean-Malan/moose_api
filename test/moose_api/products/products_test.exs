defmodule MooseApi.ProductsTest do
  use MooseApi.DataCase

  alias MooseApi.Products

  describe "product" do
    alias MooseApi.Products.Product

    @valid_attrs %{brand: "some brand", code: "some code", company_id: 42, current_stock: 120.5, gross_price: 120.5, opening_stock: 120.5, product_name: "some product_name", quantity: 120.5, tag: "some tag"}
    @update_attrs %{brand: "some updated brand", code: "some updated code", company_id: 43, current_stock: 456.7, gross_price: 456.7, opening_stock: 456.7, product_name: "some updated product_name", quantity: 456.7, tag: "some updated tag"}
    @invalid_attrs %{brand: nil, code: nil, company_id: nil, current_stock: nil, gross_price: nil, opening_stock: nil, product_name: nil, quantity: nil, tag: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_product()

      product
    end

    test "list_product/0 returns all product" do
      product = product_fixture()
      assert Products.list_product() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Products.create_product(@valid_attrs)
      assert product.brand == "some brand"
      assert product.code == "some code"
      assert product.company_id == 42
      assert product.current_stock == 120.5
      assert product.gross_price == 120.5
      assert product.opening_stock == 120.5
      assert product.product_name == "some product_name"
      assert product.quantity == 120.5
      assert product.tag == "some tag"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Products.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.brand == "some updated brand"
      assert product.code == "some updated code"
      assert product.company_id == 43
      assert product.current_stock == 456.7
      assert product.gross_price == 456.7
      assert product.opening_stock == 456.7
      assert product.product_name == "some updated product_name"
      assert product.quantity == 456.7
      assert product.tag == "some updated tag"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
