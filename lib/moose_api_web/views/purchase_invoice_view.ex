defmodule MooseApiWeb.PurchaseInvoiceView do
  use MooseApiWeb, :view
  alias MooseApiWeb.PurchaseInvoiceView

  def render("index.json", %{purchase_invoice: purchase_invoice}) do
    %{data: render_many(purchase_invoice, PurchaseInvoiceView, "purchase_invoice.json")}
  end

  def render("show.json", %{purchase_invoice: purchase_invoice}) do
    %{data: render_one(purchase_invoice, PurchaseInvoiceView, "purchase_invoice.json")}
  end

  def render("purchase_invoice.json", %{purchase_invoice: purchase_invoice}) do
    %{id: purchase_invoice.id,
      invoice_number: purchase_invoice.invoice_number,
      invoice_date: purchase_invoice.invoice_date,
      notes: purchase_invoice.notes}
  end
end
