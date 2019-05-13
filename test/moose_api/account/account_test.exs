defmodule MooseApi.AccountTest do
  use MooseApi.DataCase

  alias MooseApi.Account

  describe "bank_account" do
    alias MooseApi.Account.BankAccount

    @valid_attrs %{opening_balance: 120.5, title: "some title"}
    @update_attrs %{opening_balance: 456.7, title: "some updated title"}
    @invalid_attrs %{opening_balance: nil, title: nil}

    def bank_account_fixture(attrs \\ %{}) do
      {:ok, bank_account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_bank_account()

      bank_account
    end

    test "list_bank_account/0 returns all bank_account" do
      bank_account = bank_account_fixture()
      assert Account.list_bank_account() == [bank_account]
    end

    test "get_bank_account!/1 returns the bank_account with given id" do
      bank_account = bank_account_fixture()
      assert Account.get_bank_account!(bank_account.id) == bank_account
    end

    test "create_bank_account/1 with valid data creates a bank_account" do
      assert {:ok, %BankAccount{} = bank_account} = Account.create_bank_account(@valid_attrs)
      assert bank_account.opening_balance == 120.5
      assert bank_account.title == "some title"
    end

    test "create_bank_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_bank_account(@invalid_attrs)
    end

    test "update_bank_account/2 with valid data updates the bank_account" do
      bank_account = bank_account_fixture()
      assert {:ok, bank_account} = Account.update_bank_account(bank_account, @update_attrs)
      assert %BankAccount{} = bank_account
      assert bank_account.opening_balance == 456.7
      assert bank_account.title == "some updated title"
    end

    test "update_bank_account/2 with invalid data returns error changeset" do
      bank_account = bank_account_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_bank_account(bank_account, @invalid_attrs)
      assert bank_account == Account.get_bank_account!(bank_account.id)
    end

    test "delete_bank_account/1 deletes the bank_account" do
      bank_account = bank_account_fixture()
      assert {:ok, %BankAccount{}} = Account.delete_bank_account(bank_account)
      assert_raise Ecto.NoResultsError, fn -> Account.get_bank_account!(bank_account.id) end
    end

    test "change_bank_account/1 returns a bank_account changeset" do
      bank_account = bank_account_fixture()
      assert %Ecto.Changeset{} = Account.change_bank_account(bank_account)
    end
  end

  describe "gl_account" do
    alias MooseApi.Account.GlAccount

    @valid_attrs %{account_code: "some account_code", account_type: 42, title: "some title"}
    @update_attrs %{account_code: "some updated account_code", account_type: 43, title: "some updated title"}
    @invalid_attrs %{account_code: nil, account_type: nil, title: nil}

    def gl_account_fixture(attrs \\ %{}) do
      {:ok, gl_account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_gl_account()

      gl_account
    end

    test "list_gl_account/0 returns all gl_account" do
      gl_account = gl_account_fixture()
      assert Account.list_gl_account() == [gl_account]
    end

    test "get_gl_account!/1 returns the gl_account with given id" do
      gl_account = gl_account_fixture()
      assert Account.get_gl_account!(gl_account.id) == gl_account
    end

    test "create_gl_account/1 with valid data creates a gl_account" do
      assert {:ok, %GlAccount{} = gl_account} = Account.create_gl_account(@valid_attrs)
      assert gl_account.account_code == "some account_code"
      assert gl_account.account_type == 42
      assert gl_account.title == "some title"
    end

    test "create_gl_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_gl_account(@invalid_attrs)
    end

    test "update_gl_account/2 with valid data updates the gl_account" do
      gl_account = gl_account_fixture()
      assert {:ok, gl_account} = Account.update_gl_account(gl_account, @update_attrs)
      assert %GlAccount{} = gl_account
      assert gl_account.account_code == "some updated account_code"
      assert gl_account.account_type == 43
      assert gl_account.title == "some updated title"
    end

    test "update_gl_account/2 with invalid data returns error changeset" do
      gl_account = gl_account_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_gl_account(gl_account, @invalid_attrs)
      assert gl_account == Account.get_gl_account!(gl_account.id)
    end

    test "delete_gl_account/1 deletes the gl_account" do
      gl_account = gl_account_fixture()
      assert {:ok, %GlAccount{}} = Account.delete_gl_account(gl_account)
      assert_raise Ecto.NoResultsError, fn -> Account.get_gl_account!(gl_account.id) end
    end

    test "change_gl_account/1 returns a gl_account changeset" do
      gl_account = gl_account_fixture()
      assert %Ecto.Changeset{} = Account.change_gl_account(gl_account)
    end
  end
end
