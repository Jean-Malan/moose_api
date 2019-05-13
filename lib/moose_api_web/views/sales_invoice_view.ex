defmodule MooseApiWeb.SalesInvoiceView do
  use MooseApiWeb, :view
  alias MooseApiWeb.SalesInvoiceView

  def render("index.json", %{sales_invoice: sales_invoice}) do
    %{data: render_many(sales_invoice, SalesInvoiceView, "sales_invoice.json")}
  end

  def render("show.json", %{sales_invoice: sales_invoice}) do
    %{data: render_one(sales_invoice, SalesInvoiceView, "sales_invoice.json")}
  end

  def render("sales_invoice.json", %{sales_invoice: sales_invoice}) do
    %{id: sales_invoice.id,
      id: sales_invoice.id,
      invoice_number: sales_invoice.invoice_number,
      invoice_date: sales_invoice.invoice_date,
      notes: sales_invoice.notes}
  end
end
