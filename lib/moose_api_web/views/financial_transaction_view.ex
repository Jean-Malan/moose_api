defmodule MooseApiWeb.FinancialTransactionView do
  use MooseApiWeb, :view
  alias MooseApiWeb.FinancialTransactionView

  def render("index.json", %{financial_transactions: financial_transactions}) do
    %{data: render_many(financial_transactions, FinancialTransactionView, "financial_transaction.json")}
  end

  def render("show.json", %{financial_transaction: financial_transaction}) do
    %{data: render_one(financial_transaction, FinancialTransactionView, "financial_transaction.json")}
  end

  def render("financial_transaction.json", %{financial_transaction: financial_transaction}) do
    %{id: financial_transaction.id,
      gross_amount: financial_transaction.gross_amount,
      net_amount: financial_transaction.net_amount,
      notes: financial_transaction.notes,
      transaction_reference: financial_transaction.transaction_reference,
      transaction_date: financial_transaction.transaction_date,
      transaction_type: financial_transaction.transaction_type,
      vat_amount: financial_transaction.vat_amount,
      vat_type: financial_transaction.vat_type}
  end
end
