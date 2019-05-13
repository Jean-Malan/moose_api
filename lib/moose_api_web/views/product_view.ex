defmodule MooseApiWeb.ProductView do
  use MooseApiWeb, :view
  alias MooseApiWeb.ProductView

  def render("index.json", %{product: product}) do
    %{data: render_many(product, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      company_id: product.company_id,
      code: product.code,
      current_stock: product.current_stock,
      brand: product.brand,
      gross_price: product.gross_price,
      opening_stock: product.opening_stock,
      product_name: product.product_name,
      tag: product.tag,
      quantity: product.quantity}
  end
end
