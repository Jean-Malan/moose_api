defmodule MooseApiWeb.BankAccountView do
  use MooseApiWeb, :view
  alias MooseApiWeb.BankAccountView

  def render("index.json", %{bank_account: bank_account}) do
    %{data: render_many(bank_account, BankAccountView, "bank_account.json")}
  end

  def render("show.json", %{bank_account: bank_account}) do
    %{data: render_one(bank_account, BankAccountView, "bank_account.json")}
  end

  def render("bank_account.json", %{bank_account: bank_account}) do
    %{id: bank_account.id,
      title: bank_account.title,
      opening_balance: bank_account.opening_balance}
  end
end
