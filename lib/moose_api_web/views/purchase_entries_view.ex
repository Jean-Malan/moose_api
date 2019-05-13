defmodule MooseApiWeb.PurchaseEntriesView do
  use MooseApiWeb, :view
  alias MooseApiWeb.PurchaseEntriesView

  def render("index.json", %{purchases_entries: purchases_entries}) do
    %{data: render_many(purchases_entries, PurchaseEntriesView, "purchase_entries.json")}
  end

  def render("show.json", %{purchase_entries: purchase_entries}) do
    %{data: render_one(purchase_entries, PurchaseEntriesView, "purchase_entries.json")}
  end

  def render("purchase_entries.json", %{purchase_entries: purchase_entries}) do
    %{id: purchase_entries.id,
      description: purchase_entries.description,
      gross_price: purchase_entries.gross_price,
      net_price: purchase_entries.net_price,
      quantity: purchase_entries.quantity,
      vat_price: purchase_entries.vat_price,
      vat_type: purchase_entries.vat_type}
  end
end
