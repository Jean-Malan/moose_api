defmodule MooseApiWeb.FinancialTransactionController do
  use MooseApiWeb, :controller

  alias MooseApi.Transaction
  alias MooseApi.Transaction.FinancialTransaction

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    financial_transactions = Transaction.list_financial_transactions()
    render(conn, "index.json", financial_transactions: financial_transactions)
  end

  def create(conn, %{"financial_transaction" => financial_transaction_params}) do
    with {:ok, %FinancialTransaction{} = financial_transaction} <- Transaction.create_financial_transaction(financial_transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", financial_transaction_path(conn, :show, financial_transaction))
      |> render("show.json", financial_transaction: financial_transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    financial_transaction = Transaction.get_financial_transaction!(id)
    render(conn, "show.json", financial_transaction: financial_transaction)
  end

  def update(conn, %{"id" => id, "financial_transaction" => financial_transaction_params}) do
    financial_transaction = Transaction.get_financial_transaction!(id)

    with {:ok, %FinancialTransaction{} = financial_transaction} <- Transaction.update_financial_transaction(financial_transaction, financial_transaction_params) do
      render(conn, "show.json", financial_transaction: financial_transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    financial_transaction = Transaction.get_financial_transaction!(id)
    with {:ok, %FinancialTransaction{}} <- Transaction.delete_financial_transaction(financial_transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
