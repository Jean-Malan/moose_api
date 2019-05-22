defmodule MooseApiWeb.SalesEntriesView do
  use MooseApiWeb, :view
  alias MooseApiWeb.SalesEntriesView
  alias MooseApiWeb.SalesInvoiceView
  use JaSerializer.PhoenixView


  attributes [:description, :gross_price, :net_price, :quantity, :vat_price, :vat_type]
  has_one :user, serializer: MooseApi.Accounts.User
  has_one :sales_invoice, serializer: SalesInvoiceView

  def render("index.json", %{sales_entries: sales_entries}) do
    %{data: render_many(sales_entries, SalesEntriesView, "sales_entries.json")}
  end

  def render("show.json", %{sales_entries: sales_entries}) do
    %{data: render_one(sales_entries, SalesEntriesView, "sales_entries.json")}
  end

  def render("sales_entries.json", %{sales_entries: sales_entries}) do
    %{id: sales_entries.id,
      description: sales_entries.description,
      gross_price: sales_entries.gross_price,
      net_price: sales_entries.net_price,
      quantity: sales_entries.quantity,
      vat_price: sales_entries.vat_price,
      vat_type: sales_entries.vat_type}
  end
end
