defmodule MooseApiWeb.BankAccountController do
  use MooseApiWeb, :controller

  alias MooseApi.Account
  alias MooseApi.Account.BankAccount

  action_fallback MooseApiWeb.FallbackController

  def index(conn, _params) do
    bank_account = Account.list_bank_account()
    render(conn, "index.json", bank_account: bank_account)
  end

  def create(conn, %{"bank_account" => bank_account_params}) do
    with {:ok, %BankAccount{} = bank_account} <- Account.create_bank_account(bank_account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", bank_account_path(conn, :show, bank_account))
      |> render("show.json", bank_account: bank_account)
    end
  end

  def show(conn, %{"id" => id}) do
    bank_account = Account.get_bank_account!(id)
    render(conn, "show.json", bank_account: bank_account)
  end

  def update(conn, %{"id" => id, "bank_account" => bank_account_params}) do
    bank_account = Account.get_bank_account!(id)

    with {:ok, %BankAccount{} = bank_account} <- Account.update_bank_account(bank_account, bank_account_params) do
      render(conn, "show.json", bank_account: bank_account)
    end
  end

  def delete(conn, %{"id" => id}) do
    bank_account = Account.get_bank_account!(id)
    with {:ok, %BankAccount{}} <- Account.delete_bank_account(bank_account) do
      send_resp(conn, :no_content, "")
    end
  end
end
