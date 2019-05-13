defmodule MooseApi.JournalsTest do
  use MooseApi.DataCase

  alias MooseApi.Journals

  describe "sales_invoice" do
    alias MooseApi.Journals.SalesInvoice

    @valid_attrs %{id: 42, invoice_date: ~D[2010-04-17], invoice_number: "some invoice_number", notes: "some notes"}
    @update_attrs %{id: 43, invoice_date: ~D[2011-05-18], invoice_number: "some updated invoice_number", notes: "some updated notes"}
    @invalid_attrs %{id: nil, invoice_date: nil, invoice_number: nil, notes: nil}

    def sales_invoice_fixture(attrs \\ %{}) do
      {:ok, sales_invoice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_sales_invoice()

      sales_invoice
    end

    test "list_sales_invoice/0 returns all sales_invoice" do
      sales_invoice = sales_invoice_fixture()
      assert Journals.list_sales_invoice() == [sales_invoice]
    end

    test "get_sales_invoice!/1 returns the sales_invoice with given id" do
      sales_invoice = sales_invoice_fixture()
      assert Journals.get_sales_invoice!(sales_invoice.id) == sales_invoice
    end

    test "create_sales_invoice/1 with valid data creates a sales_invoice" do
      assert {:ok, %SalesInvoice{} = sales_invoice} = Journals.create_sales_invoice(@valid_attrs)
      assert sales_invoice.id == 42
      assert sales_invoice.invoice_date == ~D[2010-04-17]
      assert sales_invoice.invoice_number == "some invoice_number"
      assert sales_invoice.notes == "some notes"
    end

    test "create_sales_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_sales_invoice(@invalid_attrs)
    end

    test "update_sales_invoice/2 with valid data updates the sales_invoice" do
      sales_invoice = sales_invoice_fixture()
      assert {:ok, sales_invoice} = Journals.update_sales_invoice(sales_invoice, @update_attrs)
      assert %SalesInvoice{} = sales_invoice
      assert sales_invoice.id == 43
      assert sales_invoice.invoice_date == ~D[2011-05-18]
      assert sales_invoice.invoice_number == "some updated invoice_number"
      assert sales_invoice.notes == "some updated notes"
    end

    test "update_sales_invoice/2 with invalid data returns error changeset" do
      sales_invoice = sales_invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_sales_invoice(sales_invoice, @invalid_attrs)
      assert sales_invoice == Journals.get_sales_invoice!(sales_invoice.id)
    end

    test "delete_sales_invoice/1 deletes the sales_invoice" do
      sales_invoice = sales_invoice_fixture()
      assert {:ok, %SalesInvoice{}} = Journals.delete_sales_invoice(sales_invoice)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_sales_invoice!(sales_invoice.id) end
    end

    test "change_sales_invoice/1 returns a sales_invoice changeset" do
      sales_invoice = sales_invoice_fixture()
      assert %Ecto.Changeset{} = Journals.change_sales_invoice(sales_invoice)
    end
  end

  describe "sales_entries" do
    alias MooseApi.Journals.SalesEntries

    @valid_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_price: 120.5, vat_type: 42}
    @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_price: 456.7, vat_type: 43}
    @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_price: nil, vat_type: nil}

    def sales_entries_fixture(attrs \\ %{}) do
      {:ok, sales_entries} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_sales_entries()

      sales_entries
    end

    test "list_sales_entries/0 returns all sales_entries" do
      sales_entries = sales_entries_fixture()
      assert Journals.list_sales_entries() == [sales_entries]
    end

    test "get_sales_entries!/1 returns the sales_entries with given id" do
      sales_entries = sales_entries_fixture()
      assert Journals.get_sales_entries!(sales_entries.id) == sales_entries
    end

    test "create_sales_entries/1 with valid data creates a sales_entries" do
      assert {:ok, %SalesEntries{} = sales_entries} = Journals.create_sales_entries(@valid_attrs)
      assert sales_entries.description == "some description"
      assert sales_entries.gross_price == 120.5
      assert sales_entries.net_price == 120.5
      assert sales_entries.quantity == 120.5
      assert sales_entries.vat_price == 120.5
      assert sales_entries.vat_type == 42
    end

    test "create_sales_entries/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_sales_entries(@invalid_attrs)
    end

    test "update_sales_entries/2 with valid data updates the sales_entries" do
      sales_entries = sales_entries_fixture()
      assert {:ok, sales_entries} = Journals.update_sales_entries(sales_entries, @update_attrs)
      assert %SalesEntries{} = sales_entries
      assert sales_entries.description == "some updated description"
      assert sales_entries.gross_price == 456.7
      assert sales_entries.net_price == 456.7
      assert sales_entries.quantity == 456.7
      assert sales_entries.vat_price == 456.7
      assert sales_entries.vat_type == 43
    end

    test "update_sales_entries/2 with invalid data returns error changeset" do
      sales_entries = sales_entries_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_sales_entries(sales_entries, @invalid_attrs)
      assert sales_entries == Journals.get_sales_entries!(sales_entries.id)
    end

    test "delete_sales_entries/1 deletes the sales_entries" do
      sales_entries = sales_entries_fixture()
      assert {:ok, %SalesEntries{}} = Journals.delete_sales_entries(sales_entries)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_sales_entries!(sales_entries.id) end
    end

    test "change_sales_entries/1 returns a sales_entries changeset" do
      sales_entries = sales_entries_fixture()
      assert %Ecto.Changeset{} = Journals.change_sales_entries(sales_entries)
    end
  end

  describe "purchase_invoice" do
    alias MooseApi.Journals.PurchaseInvoice

    @valid_attrs %{invoice_date: ~D[2010-04-17], invoice_number: "some invoice_number", notes: "some notes"}
    @update_attrs %{invoice_date: ~D[2011-05-18], invoice_number: "some updated invoice_number", notes: "some updated notes"}
    @invalid_attrs %{invoice_date: nil, invoice_number: nil, notes: nil}

    def purchase_invoice_fixture(attrs \\ %{}) do
      {:ok, purchase_invoice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_purchase_invoice()

      purchase_invoice
    end

    test "list_purchase_invoice/0 returns all purchase_invoice" do
      purchase_invoice = purchase_invoice_fixture()
      assert Journals.list_purchase_invoice() == [purchase_invoice]
    end

    test "get_purchase_invoice!/1 returns the purchase_invoice with given id" do
      purchase_invoice = purchase_invoice_fixture()
      assert Journals.get_purchase_invoice!(purchase_invoice.id) == purchase_invoice
    end

    test "create_purchase_invoice/1 with valid data creates a purchase_invoice" do
      assert {:ok, %PurchaseInvoice{} = purchase_invoice} = Journals.create_purchase_invoice(@valid_attrs)
      assert purchase_invoice.invoice_date == ~D[2010-04-17]
      assert purchase_invoice.invoice_number == "some invoice_number"
      assert purchase_invoice.notes == "some notes"
    end

    test "create_purchase_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_purchase_invoice(@invalid_attrs)
    end

    test "update_purchase_invoice/2 with valid data updates the purchase_invoice" do
      purchase_invoice = purchase_invoice_fixture()
      assert {:ok, purchase_invoice} = Journals.update_purchase_invoice(purchase_invoice, @update_attrs)
      assert %PurchaseInvoice{} = purchase_invoice
      assert purchase_invoice.invoice_date == ~D[2011-05-18]
      assert purchase_invoice.invoice_number == "some updated invoice_number"
      assert purchase_invoice.notes == "some updated notes"
    end

    test "update_purchase_invoice/2 with invalid data returns error changeset" do
      purchase_invoice = purchase_invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_purchase_invoice(purchase_invoice, @invalid_attrs)
      assert purchase_invoice == Journals.get_purchase_invoice!(purchase_invoice.id)
    end

    test "delete_purchase_invoice/1 deletes the purchase_invoice" do
      purchase_invoice = purchase_invoice_fixture()
      assert {:ok, %PurchaseInvoice{}} = Journals.delete_purchase_invoice(purchase_invoice)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_purchase_invoice!(purchase_invoice.id) end
    end

    test "change_purchase_invoice/1 returns a purchase_invoice changeset" do
      purchase_invoice = purchase_invoice_fixture()
      assert %Ecto.Changeset{} = Journals.change_purchase_invoice(purchase_invoice)
    end
  end

  describe "purchases_entries" do
    alias MooseApi.Journals.PurchaseEntries

    @valid_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_price: 120.5, vat_type: 42}
    @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_price: 456.7, vat_type: 43}
    @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_price: nil, vat_type: nil}

    def purchase_entries_fixture(attrs \\ %{}) do
      {:ok, purchase_entries} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_purchase_entries()

      purchase_entries
    end

    test "list_purchases_entries/0 returns all purchases_entries" do
      purchase_entries = purchase_entries_fixture()
      assert Journals.list_purchases_entries() == [purchase_entries]
    end

    test "get_purchase_entries!/1 returns the purchase_entries with given id" do
      purchase_entries = purchase_entries_fixture()
      assert Journals.get_purchase_entries!(purchase_entries.id) == purchase_entries
    end

    test "create_purchase_entries/1 with valid data creates a purchase_entries" do
      assert {:ok, %PurchaseEntries{} = purchase_entries} = Journals.create_purchase_entries(@valid_attrs)
      assert purchase_entries.description == "some description"
      assert purchase_entries.gross_price == 120.5
      assert purchase_entries.net_price == 120.5
      assert purchase_entries.quantity == 120.5
      assert purchase_entries.vat_price == 120.5
      assert purchase_entries.vat_type == 42
    end

    test "create_purchase_entries/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_purchase_entries(@invalid_attrs)
    end

    test "update_purchase_entries/2 with valid data updates the purchase_entries" do
      purchase_entries = purchase_entries_fixture()
      assert {:ok, purchase_entries} = Journals.update_purchase_entries(purchase_entries, @update_attrs)
      assert %PurchaseEntries{} = purchase_entries
      assert purchase_entries.description == "some updated description"
      assert purchase_entries.gross_price == 456.7
      assert purchase_entries.net_price == 456.7
      assert purchase_entries.quantity == 456.7
      assert purchase_entries.vat_price == 456.7
      assert purchase_entries.vat_type == 43
    end

    test "update_purchase_entries/2 with invalid data returns error changeset" do
      purchase_entries = purchase_entries_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_purchase_entries(purchase_entries, @invalid_attrs)
      assert purchase_entries == Journals.get_purchase_entries!(purchase_entries.id)
    end

    test "delete_purchase_entries/1 deletes the purchase_entries" do
      purchase_entries = purchase_entries_fixture()
      assert {:ok, %PurchaseEntries{}} = Journals.delete_purchase_entries(purchase_entries)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_purchase_entries!(purchase_entries.id) end
    end

    test "change_purchase_entries/1 returns a purchase_entries changeset" do
      purchase_entries = purchase_entries_fixture()
      assert %Ecto.Changeset{} = Journals.change_purchase_entries(purchase_entries)
    end
  end

  describe "general_journal" do
    alias MooseApi.Journals.GeneralJournal

    @valid_attrs %{description: "some description", journal_date: ~N[2010-04-17 14:00:00.000000], journal_reference: "some journal_reference"}
    @update_attrs %{description: "some updated description", journal_date: ~N[2011-05-18 15:01:01.000000], journal_reference: "some updated journal_reference"}
    @invalid_attrs %{description: nil, journal_date: nil, journal_reference: nil}

    def general_journal_fixture(attrs \\ %{}) do
      {:ok, general_journal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_general_journal()

      general_journal
    end

    test "list_general_journal/0 returns all general_journal" do
      general_journal = general_journal_fixture()
      assert Journals.list_general_journal() == [general_journal]
    end

    test "get_general_journal!/1 returns the general_journal with given id" do
      general_journal = general_journal_fixture()
      assert Journals.get_general_journal!(general_journal.id) == general_journal
    end

    test "create_general_journal/1 with valid data creates a general_journal" do
      assert {:ok, %GeneralJournal{} = general_journal} = Journals.create_general_journal(@valid_attrs)
      assert general_journal.description == "some description"
      assert general_journal.journal_date == ~N[2010-04-17 14:00:00.000000]
      assert general_journal.journal_reference == "some journal_reference"
    end

    test "create_general_journal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_general_journal(@invalid_attrs)
    end

    test "update_general_journal/2 with valid data updates the general_journal" do
      general_journal = general_journal_fixture()
      assert {:ok, general_journal} = Journals.update_general_journal(general_journal, @update_attrs)
      assert %GeneralJournal{} = general_journal
      assert general_journal.description == "some updated description"
      assert general_journal.journal_date == ~N[2011-05-18 15:01:01.000000]
      assert general_journal.journal_reference == "some updated journal_reference"
    end

    test "update_general_journal/2 with invalid data returns error changeset" do
      general_journal = general_journal_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_general_journal(general_journal, @invalid_attrs)
      assert general_journal == Journals.get_general_journal!(general_journal.id)
    end

    test "delete_general_journal/1 deletes the general_journal" do
      general_journal = general_journal_fixture()
      assert {:ok, %GeneralJournal{}} = Journals.delete_general_journal(general_journal)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_general_journal!(general_journal.id) end
    end

    test "change_general_journal/1 returns a general_journal changeset" do
      general_journal = general_journal_fixture()
      assert %Ecto.Changeset{} = Journals.change_general_journal(general_journal)
    end
  end

  describe "general_journal_entries" do
    alias MooseApi.Journals.GeneralJournalEntries

    @valid_attrs %{description: "some description", gross_amount: 120.5, net_amount: 120.5, transaction_type: 42, vat_amount: 120.5}
    @update_attrs %{description: "some updated description", gross_amount: 456.7, net_amount: 456.7, transaction_type: 43, vat_amount: 456.7}
    @invalid_attrs %{description: nil, gross_amount: nil, net_amount: nil, transaction_type: nil, vat_amount: nil}

    def general_journal_entries_fixture(attrs \\ %{}) do
      {:ok, general_journal_entries} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_general_journal_entries()

      general_journal_entries
    end

    test "list_general_journal_entries/0 returns all general_journal_entries" do
      general_journal_entries = general_journal_entries_fixture()
      assert Journals.list_general_journal_entries() == [general_journal_entries]
    end

    test "get_general_journal_entries!/1 returns the general_journal_entries with given id" do
      general_journal_entries = general_journal_entries_fixture()
      assert Journals.get_general_journal_entries!(general_journal_entries.id) == general_journal_entries
    end

    test "create_general_journal_entries/1 with valid data creates a general_journal_entries" do
      assert {:ok, %GeneralJournalEntries{} = general_journal_entries} = Journals.create_general_journal_entries(@valid_attrs)
      assert general_journal_entries.description == "some description"
      assert general_journal_entries.gross_amount == 120.5
      assert general_journal_entries.net_amount == 120.5
      assert general_journal_entries.transaction_type == 42
      assert general_journal_entries.vat_amount == 120.5
    end

    test "create_general_journal_entries/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_general_journal_entries(@invalid_attrs)
    end

    test "update_general_journal_entries/2 with valid data updates the general_journal_entries" do
      general_journal_entries = general_journal_entries_fixture()
      assert {:ok, general_journal_entries} = Journals.update_general_journal_entries(general_journal_entries, @update_attrs)
      assert %GeneralJournalEntries{} = general_journal_entries
      assert general_journal_entries.description == "some updated description"
      assert general_journal_entries.gross_amount == 456.7
      assert general_journal_entries.net_amount == 456.7
      assert general_journal_entries.transaction_type == 43
      assert general_journal_entries.vat_amount == 456.7
    end

    test "update_general_journal_entries/2 with invalid data returns error changeset" do
      general_journal_entries = general_journal_entries_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_general_journal_entries(general_journal_entries, @invalid_attrs)
      assert general_journal_entries == Journals.get_general_journal_entries!(general_journal_entries.id)
    end

    test "delete_general_journal_entries/1 deletes the general_journal_entries" do
      general_journal_entries = general_journal_entries_fixture()
      assert {:ok, %GeneralJournalEntries{}} = Journals.delete_general_journal_entries(general_journal_entries)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_general_journal_entries!(general_journal_entries.id) end
    end

    test "change_general_journal_entries/1 returns a general_journal_entries changeset" do
      general_journal_entries = general_journal_entries_fixture()
      assert %Ecto.Changeset{} = Journals.change_general_journal_entries(general_journal_entries)
    end
  end

  describe "credit_note" do
    alias MooseApi.Journals.CreditNote

    @valid_attrs %{credit_note_number: "some credit_note_number", invoice_date: ~D[2010-04-17], notes: "some notes"}
    @update_attrs %{credit_note_number: "some updated credit_note_number", invoice_date: ~D[2011-05-18], notes: "some updated notes"}
    @invalid_attrs %{credit_note_number: nil, invoice_date: nil, notes: nil}

    def credit_note_fixture(attrs \\ %{}) do
      {:ok, credit_note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_credit_note()

      credit_note
    end

    test "list_credit_note/0 returns all credit_note" do
      credit_note = credit_note_fixture()
      assert Journals.list_credit_note() == [credit_note]
    end

    test "get_credit_note!/1 returns the credit_note with given id" do
      credit_note = credit_note_fixture()
      assert Journals.get_credit_note!(credit_note.id) == credit_note
    end

    test "create_credit_note/1 with valid data creates a credit_note" do
      assert {:ok, %CreditNote{} = credit_note} = Journals.create_credit_note(@valid_attrs)
      assert credit_note.credit_note_number == "some credit_note_number"
      assert credit_note.invoice_date == ~D[2010-04-17]
      assert credit_note.notes == "some notes"
    end

    test "create_credit_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_credit_note(@invalid_attrs)
    end

    test "update_credit_note/2 with valid data updates the credit_note" do
      credit_note = credit_note_fixture()
      assert {:ok, credit_note} = Journals.update_credit_note(credit_note, @update_attrs)
      assert %CreditNote{} = credit_note
      assert credit_note.credit_note_number == "some updated credit_note_number"
      assert credit_note.invoice_date == ~D[2011-05-18]
      assert credit_note.notes == "some updated notes"
    end

    test "update_credit_note/2 with invalid data returns error changeset" do
      credit_note = credit_note_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_credit_note(credit_note, @invalid_attrs)
      assert credit_note == Journals.get_credit_note!(credit_note.id)
    end

    test "delete_credit_note/1 deletes the credit_note" do
      credit_note = credit_note_fixture()
      assert {:ok, %CreditNote{}} = Journals.delete_credit_note(credit_note)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_credit_note!(credit_note.id) end
    end

    test "change_credit_note/1 returns a credit_note changeset" do
      credit_note = credit_note_fixture()
      assert %Ecto.Changeset{} = Journals.change_credit_note(credit_note)
    end
  end

  describe "credit_note_entries" do
    alias MooseApi.Journals.CreditNoteEntries

    @valid_attrs %{description: "some description", gross_price: 120.5, net_price: 120.5, quantity: 120.5, vat_amount: 120.5, vat_type: 42}
    @update_attrs %{description: "some updated description", gross_price: 456.7, net_price: 456.7, quantity: 456.7, vat_amount: 456.7, vat_type: 43}
    @invalid_attrs %{description: nil, gross_price: nil, net_price: nil, quantity: nil, vat_amount: nil, vat_type: nil}

    def credit_note_entries_fixture(attrs \\ %{}) do
      {:ok, credit_note_entries} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Journals.create_credit_note_entries()

      credit_note_entries
    end

    test "list_credit_note_entries/0 returns all credit_note_entries" do
      credit_note_entries = credit_note_entries_fixture()
      assert Journals.list_credit_note_entries() == [credit_note_entries]
    end

    test "get_credit_note_entries!/1 returns the credit_note_entries with given id" do
      credit_note_entries = credit_note_entries_fixture()
      assert Journals.get_credit_note_entries!(credit_note_entries.id) == credit_note_entries
    end

    test "create_credit_note_entries/1 with valid data creates a credit_note_entries" do
      assert {:ok, %CreditNoteEntries{} = credit_note_entries} = Journals.create_credit_note_entries(@valid_attrs)
      assert credit_note_entries.description == "some description"
      assert credit_note_entries.gross_price == 120.5
      assert credit_note_entries.net_price == 120.5
      assert credit_note_entries.quantity == 120.5
      assert credit_note_entries.vat_amount == 120.5
      assert credit_note_entries.vat_type == 42
    end

    test "create_credit_note_entries/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journals.create_credit_note_entries(@invalid_attrs)
    end

    test "update_credit_note_entries/2 with valid data updates the credit_note_entries" do
      credit_note_entries = credit_note_entries_fixture()
      assert {:ok, credit_note_entries} = Journals.update_credit_note_entries(credit_note_entries, @update_attrs)
      assert %CreditNoteEntries{} = credit_note_entries
      assert credit_note_entries.description == "some updated description"
      assert credit_note_entries.gross_price == 456.7
      assert credit_note_entries.net_price == 456.7
      assert credit_note_entries.quantity == 456.7
      assert credit_note_entries.vat_amount == 456.7
      assert credit_note_entries.vat_type == 43
    end

    test "update_credit_note_entries/2 with invalid data returns error changeset" do
      credit_note_entries = credit_note_entries_fixture()
      assert {:error, %Ecto.Changeset{}} = Journals.update_credit_note_entries(credit_note_entries, @invalid_attrs)
      assert credit_note_entries == Journals.get_credit_note_entries!(credit_note_entries.id)
    end

    test "delete_credit_note_entries/1 deletes the credit_note_entries" do
      credit_note_entries = credit_note_entries_fixture()
      assert {:ok, %CreditNoteEntries{}} = Journals.delete_credit_note_entries(credit_note_entries)
      assert_raise Ecto.NoResultsError, fn -> Journals.get_credit_note_entries!(credit_note_entries.id) end
    end

    test "change_credit_note_entries/1 returns a credit_note_entries changeset" do
      credit_note_entries = credit_note_entries_fixture()
      assert %Ecto.Changeset{} = Journals.change_credit_note_entries(credit_note_entries)
    end
  end
end
