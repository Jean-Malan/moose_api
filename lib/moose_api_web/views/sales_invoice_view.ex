defmodule MooseApiWeb.SalesInvoiceView do
  use MooseApiWeb, :view
  
  alias MooseApiWeb.SalesInvoiceView
  alias MooseApiWeb.ContactView
  alias MooseApiWeb.UserView
  alias MooseApiWeb.SalesEntriesView
  use JaSerializer.PhoenixView

  attributes [:id, :invoice_number, :invoice_date, :note, :entries, :derived, :net_price, :sales_entries]

  # has_one :user,
  #   serializer: UserView

  has_one :contact,
    serializer: ContactView

  # has_many :sales_entries,
  #   serializer: SalesEntriesView,
  #   identifiers: :always


  def render("index.json", %{data: sales_invoice}) do
    %{data: render_many(sales_invoice, SalesInvoiceView, "sales_invoice.json-api")}
  end

  def render("show.json", %{sales_invoice: sales_invoice}) do
    %{data: render_one(sales_invoice, SalesInvoiceView, "sales_invoice.json-api")}
  end

  def render("sales_invoice.json-api", %{sales_invoice: sales_invoice}) do
    %{id: sales_invoice.id,
      invoice_number: sales_invoice.invoice_number,
      user: sales_invoice.user_id,
      invoice_date: sales_invoice.invoice_date,
      entries: sales_invoice.sales_entries.description,
      notes: sales_invoice.notes}
  end

end
