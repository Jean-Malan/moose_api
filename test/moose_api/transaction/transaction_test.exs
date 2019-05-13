defmodule MooseApi.TransactionTest do
  use MooseApi.DataCase

  alias MooseApi.Transaction

  describe "financial_transactions" do
    alias MooseApi.Transaction.FinancialTransaction

    @valid_attrs %{gross_amount: 120.5, net_amount: 120.5, notes: "some notes", transaction_date: ~N[2010-04-17 14:00:00.000000], transaction_reference: "some transaction_reference", transaction_type: 42, vat_amount: 120.5, vat_type: 120.5}
    @update_attrs %{gross_amount: 456.7, net_amount: 456.7, notes: "some updated notes", transaction_date: ~N[2011-05-18 15:01:01.000000], transaction_reference: "some updated transaction_reference", transaction_type: 43, vat_amount: 456.7, vat_type: 456.7}
    @invalid_attrs %{gross_amount: nil, net_amount: nil, notes: nil, transaction_date: nil, transaction_reference: nil, transaction_type: nil, vat_amount: nil, vat_type: nil}

    def financial_transaction_fixture(attrs \\ %{}) do
      {:ok, financial_transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transaction.create_financial_transaction()

      financial_transaction
    end

    test "list_financial_transactions/0 returns all financial_transactions" do
      financial_transaction = financial_transaction_fixture()
      assert Transaction.list_financial_transactions() == [financial_transaction]
    end

    test "get_financial_transaction!/1 returns the financial_transaction with given id" do
      financial_transaction = financial_transaction_fixture()
      assert Transaction.get_financial_transaction!(financial_transaction.id) == financial_transaction
    end

    test "create_financial_transaction/1 with valid data creates a financial_transaction" do
      assert {:ok, %FinancialTransaction{} = financial_transaction} = Transaction.create_financial_transaction(@valid_attrs)
      assert financial_transaction.gross_amount == 120.5
      assert financial_transaction.net_amount == 120.5
      assert financial_transaction.notes == "some notes"
      assert financial_transaction.transaction_date == ~N[2010-04-17 14:00:00.000000]
      assert financial_transaction.transaction_reference == "some transaction_reference"
      assert financial_transaction.transaction_type == 42
      assert financial_transaction.vat_amount == 120.5
      assert financial_transaction.vat_type == 120.5
    end

    test "create_financial_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transaction.create_financial_transaction(@invalid_attrs)
    end

    test "update_financial_transaction/2 with valid data updates the financial_transaction" do
      financial_transaction = financial_transaction_fixture()
      assert {:ok, financial_transaction} = Transaction.update_financial_transaction(financial_transaction, @update_attrs)
      assert %FinancialTransaction{} = financial_transaction
      assert financial_transaction.gross_amount == 456.7
      assert financial_transaction.net_amount == 456.7
      assert financial_transaction.notes == "some updated notes"
      assert financial_transaction.transaction_date == ~N[2011-05-18 15:01:01.000000]
      assert financial_transaction.transaction_reference == "some updated transaction_reference"
      assert financial_transaction.transaction_type == 43
      assert financial_transaction.vat_amount == 456.7
      assert financial_transaction.vat_type == 456.7
    end

    test "update_financial_transaction/2 with invalid data returns error changeset" do
      financial_transaction = financial_transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Transaction.update_financial_transaction(financial_transaction, @invalid_attrs)
      assert financial_transaction == Transaction.get_financial_transaction!(financial_transaction.id)
    end

    test "delete_financial_transaction/1 deletes the financial_transaction" do
      financial_transaction = financial_transaction_fixture()
      assert {:ok, %FinancialTransaction{}} = Transaction.delete_financial_transaction(financial_transaction)
      assert_raise Ecto.NoResultsError, fn -> Transaction.get_financial_transaction!(financial_transaction.id) end
    end

    test "change_financial_transaction/1 returns a financial_transaction changeset" do
      financial_transaction = financial_transaction_fixture()
      assert %Ecto.Changeset{} = Transaction.change_financial_transaction(financial_transaction)
    end
  end
end
