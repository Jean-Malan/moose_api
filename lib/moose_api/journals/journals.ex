defmodule MooseApi.Journals do
  @moduledoc """
  The Journals context.
  """

  import Ecto.Query, warn: false
  alias MooseApi.Repo

  alias MooseApi.Journals.SalesInvoice

  @doc """
  Returns the list of sales_invoice.

  ## Examples

      iex> list_sales_invoice()
      [%SalesInvoice{}, ...]

  """
  def list_sales_invoice do
    Repo.all(SalesInvoice)
  end

  @doc """
  Gets a single sales_invoice.

  Raises `Ecto.NoResultsError` if the Sales invoice does not exist.

  ## Examples

      iex> get_sales_invoice!(123)
      %SalesInvoice{}

      iex> get_sales_invoice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sales_invoice!(id), do: Repo.get!(SalesInvoice, id)

  @doc """
  Creates a sales_invoice.

  ## Examples

      iex> create_sales_invoice(%{field: value})
      {:ok, %SalesInvoice{}}

      iex> create_sales_invoice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sales_invoice(attrs \\ %{}) do
    %SalesInvoice{}
    |> SalesInvoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sales_invoice.

  ## Examples

      iex> update_sales_invoice(sales_invoice, %{field: new_value})
      {:ok, %SalesInvoice{}}

      iex> update_sales_invoice(sales_invoice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sales_invoice(%SalesInvoice{} = sales_invoice, attrs) do
    sales_invoice
    |> SalesInvoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SalesInvoice.

  ## Examples

      iex> delete_sales_invoice(sales_invoice)
      {:ok, %SalesInvoice{}}

      iex> delete_sales_invoice(sales_invoice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sales_invoice(%SalesInvoice{} = sales_invoice) do
    Repo.delete(sales_invoice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sales_invoice changes.

  ## Examples

      iex> change_sales_invoice(sales_invoice)
      %Ecto.Changeset{source: %SalesInvoice{}}

  """
  def change_sales_invoice(%SalesInvoice{} = sales_invoice) do
    SalesInvoice.changeset(sales_invoice, %{})
  end

  alias MooseApi.Journals.SalesEntries

  @doc """
  Returns the list of sales_entries.

  ## Examples

      iex> list_sales_entries()
      [%SalesEntries{}, ...]

  """
  def list_sales_entries do
    Repo.all(SalesEntries)
  end

  @doc """
  Gets a single sales_entries.

  Raises `Ecto.NoResultsError` if the Sales entries does not exist.

  ## Examples

      iex> get_sales_entries!(123)
      %SalesEntries{}

      iex> get_sales_entries!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sales_entries!(id), do: Repo.get!(SalesEntries, id)

  @doc """
  Creates a sales_entries.

  ## Examples

      iex> create_sales_entries(%{field: value})
      {:ok, %SalesEntries{}}

      iex> create_sales_entries(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sales_entries(attrs \\ %{}) do
    %SalesEntries{}
    |> SalesEntries.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sales_entries.

  ## Examples

      iex> update_sales_entries(sales_entries, %{field: new_value})
      {:ok, %SalesEntries{}}

      iex> update_sales_entries(sales_entries, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sales_entries(%SalesEntries{} = sales_entries, attrs) do
    sales_entries
    |> SalesEntries.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SalesEntries.

  ## Examples

      iex> delete_sales_entries(sales_entries)
      {:ok, %SalesEntries{}}

      iex> delete_sales_entries(sales_entries)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sales_entries(%SalesEntries{} = sales_entries) do
    Repo.delete(sales_entries)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sales_entries changes.

  ## Examples

      iex> change_sales_entries(sales_entries)
      %Ecto.Changeset{source: %SalesEntries{}}

  """
  def change_sales_entries(%SalesEntries{} = sales_entries) do
    SalesEntries.changeset(sales_entries, %{})
  end

  alias MooseApi.Journals.PurchaseInvoice

  @doc """
  Returns the list of purchase_invoice.

  ## Examples

      iex> list_purchase_invoice()
      [%PurchaseInvoice{}, ...]

  """
  def list_purchase_invoice do
    Repo.all(PurchaseInvoice)
  end

  @doc """
  Gets a single purchase_invoice.

  Raises `Ecto.NoResultsError` if the Purchase invoice does not exist.

  ## Examples

      iex> get_purchase_invoice!(123)
      %PurchaseInvoice{}

      iex> get_purchase_invoice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase_invoice!(id), do: Repo.get!(PurchaseInvoice, id)

  @doc """
  Creates a purchase_invoice.

  ## Examples

      iex> create_purchase_invoice(%{field: value})
      {:ok, %PurchaseInvoice{}}

      iex> create_purchase_invoice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase_invoice(attrs \\ %{}) do
    %PurchaseInvoice{}
    |> PurchaseInvoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase_invoice.

  ## Examples

      iex> update_purchase_invoice(purchase_invoice, %{field: new_value})
      {:ok, %PurchaseInvoice{}}

      iex> update_purchase_invoice(purchase_invoice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase_invoice(%PurchaseInvoice{} = purchase_invoice, attrs) do
    purchase_invoice
    |> PurchaseInvoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PurchaseInvoice.

  ## Examples

      iex> delete_purchase_invoice(purchase_invoice)
      {:ok, %PurchaseInvoice{}}

      iex> delete_purchase_invoice(purchase_invoice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase_invoice(%PurchaseInvoice{} = purchase_invoice) do
    Repo.delete(purchase_invoice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase_invoice changes.

  ## Examples

      iex> change_purchase_invoice(purchase_invoice)
      %Ecto.Changeset{source: %PurchaseInvoice{}}

  """
  def change_purchase_invoice(%PurchaseInvoice{} = purchase_invoice) do
    PurchaseInvoice.changeset(purchase_invoice, %{})
  end

  alias MooseApi.Journals.PurchaseEntries

  @doc """
  Returns the list of purchases_entries.

  ## Examples

      iex> list_purchases_entries()
      [%PurchaseEntries{}, ...]

  """
  def list_purchases_entries do
    Repo.all(PurchaseEntries)
  end

  @doc """
  Gets a single purchase_entries.

  Raises `Ecto.NoResultsError` if the Purchase entries does not exist.

  ## Examples

      iex> get_purchase_entries!(123)
      %PurchaseEntries{}

      iex> get_purchase_entries!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase_entries!(id), do: Repo.get!(PurchaseEntries, id)

  @doc """
  Creates a purchase_entries.

  ## Examples

      iex> create_purchase_entries(%{field: value})
      {:ok, %PurchaseEntries{}}

      iex> create_purchase_entries(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase_entries(attrs \\ %{}) do
    %PurchaseEntries{}
    |> PurchaseEntries.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase_entries.

  ## Examples

      iex> update_purchase_entries(purchase_entries, %{field: new_value})
      {:ok, %PurchaseEntries{}}

      iex> update_purchase_entries(purchase_entries, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase_entries(%PurchaseEntries{} = purchase_entries, attrs) do
    purchase_entries
    |> PurchaseEntries.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PurchaseEntries.

  ## Examples

      iex> delete_purchase_entries(purchase_entries)
      {:ok, %PurchaseEntries{}}

      iex> delete_purchase_entries(purchase_entries)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase_entries(%PurchaseEntries{} = purchase_entries) do
    Repo.delete(purchase_entries)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase_entries changes.

  ## Examples

      iex> change_purchase_entries(purchase_entries)
      %Ecto.Changeset{source: %PurchaseEntries{}}

  """
  def change_purchase_entries(%PurchaseEntries{} = purchase_entries) do
    PurchaseEntries.changeset(purchase_entries, %{})
  end

  alias MooseApi.Journals.GeneralJournal

  @doc """
  Returns the list of general_journal.

  ## Examples

      iex> list_general_journal()
      [%GeneralJournal{}, ...]

  """
  def list_general_journal do
    Repo.all(GeneralJournal)
  end

  @doc """
  Gets a single general_journal.

  Raises `Ecto.NoResultsError` if the General journal does not exist.

  ## Examples

      iex> get_general_journal!(123)
      %GeneralJournal{}

      iex> get_general_journal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_general_journal!(id), do: Repo.get!(GeneralJournal, id)

  @doc """
  Creates a general_journal.

  ## Examples

      iex> create_general_journal(%{field: value})
      {:ok, %GeneralJournal{}}

      iex> create_general_journal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_general_journal(attrs \\ %{}) do
    %GeneralJournal{}
    |> GeneralJournal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a general_journal.

  ## Examples

      iex> update_general_journal(general_journal, %{field: new_value})
      {:ok, %GeneralJournal{}}

      iex> update_general_journal(general_journal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_general_journal(%GeneralJournal{} = general_journal, attrs) do
    general_journal
    |> GeneralJournal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GeneralJournal.

  ## Examples

      iex> delete_general_journal(general_journal)
      {:ok, %GeneralJournal{}}

      iex> delete_general_journal(general_journal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_general_journal(%GeneralJournal{} = general_journal) do
    Repo.delete(general_journal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking general_journal changes.

  ## Examples

      iex> change_general_journal(general_journal)
      %Ecto.Changeset{source: %GeneralJournal{}}

  """
  def change_general_journal(%GeneralJournal{} = general_journal) do
    GeneralJournal.changeset(general_journal, %{})
  end

  alias MooseApi.Journals.GeneralJournalEntries

  @doc """
  Returns the list of general_journal_entries.

  ## Examples

      iex> list_general_journal_entries()
      [%GeneralJournalEntries{}, ...]

  """
  def list_general_journal_entries do
    Repo.all(GeneralJournalEntries)
  end

  @doc """
  Gets a single general_journal_entries.

  Raises `Ecto.NoResultsError` if the General journal entries does not exist.

  ## Examples

      iex> get_general_journal_entries!(123)
      %GeneralJournalEntries{}

      iex> get_general_journal_entries!(456)
      ** (Ecto.NoResultsError)

  """
  def get_general_journal_entries!(id), do: Repo.get!(GeneralJournalEntries, id)

  @doc """
  Creates a general_journal_entries.

  ## Examples

      iex> create_general_journal_entries(%{field: value})
      {:ok, %GeneralJournalEntries{}}

      iex> create_general_journal_entries(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_general_journal_entries(attrs \\ %{}) do
    %GeneralJournalEntries{}
    |> GeneralJournalEntries.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a general_journal_entries.

  ## Examples

      iex> update_general_journal_entries(general_journal_entries, %{field: new_value})
      {:ok, %GeneralJournalEntries{}}

      iex> update_general_journal_entries(general_journal_entries, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_general_journal_entries(%GeneralJournalEntries{} = general_journal_entries, attrs) do
    general_journal_entries
    |> GeneralJournalEntries.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GeneralJournalEntries.

  ## Examples

      iex> delete_general_journal_entries(general_journal_entries)
      {:ok, %GeneralJournalEntries{}}

      iex> delete_general_journal_entries(general_journal_entries)
      {:error, %Ecto.Changeset{}}

  """
  def delete_general_journal_entries(%GeneralJournalEntries{} = general_journal_entries) do
    Repo.delete(general_journal_entries)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking general_journal_entries changes.

  ## Examples

      iex> change_general_journal_entries(general_journal_entries)
      %Ecto.Changeset{source: %GeneralJournalEntries{}}

  """
  def change_general_journal_entries(%GeneralJournalEntries{} = general_journal_entries) do
    GeneralJournalEntries.changeset(general_journal_entries, %{})
  end

  alias MooseApi.Journals.CreditNote

  @doc """
  Returns the list of credit_note.

  ## Examples

      iex> list_credit_note()
      [%CreditNote{}, ...]

  """
  def list_credit_note do
    Repo.all(CreditNote)
  end

  @doc """
  Gets a single credit_note.

  Raises `Ecto.NoResultsError` if the Credit note does not exist.

  ## Examples

      iex> get_credit_note!(123)
      %CreditNote{}

      iex> get_credit_note!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit_note!(id), do: Repo.get!(CreditNote, id)

  @doc """
  Creates a credit_note.

  ## Examples

      iex> create_credit_note(%{field: value})
      {:ok, %CreditNote{}}

      iex> create_credit_note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit_note(attrs \\ %{}) do
    %CreditNote{}
    |> CreditNote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit_note.

  ## Examples

      iex> update_credit_note(credit_note, %{field: new_value})
      {:ok, %CreditNote{}}

      iex> update_credit_note(credit_note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit_note(%CreditNote{} = credit_note, attrs) do
    credit_note
    |> CreditNote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CreditNote.

  ## Examples

      iex> delete_credit_note(credit_note)
      {:ok, %CreditNote{}}

      iex> delete_credit_note(credit_note)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit_note(%CreditNote{} = credit_note) do
    Repo.delete(credit_note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit_note changes.

  ## Examples

      iex> change_credit_note(credit_note)
      %Ecto.Changeset{source: %CreditNote{}}

  """
  def change_credit_note(%CreditNote{} = credit_note) do
    CreditNote.changeset(credit_note, %{})
  end

  alias MooseApi.Journals.CreditNoteEntries

  @doc """
  Returns the list of credit_note_entries.

  ## Examples

      iex> list_credit_note_entries()
      [%CreditNoteEntries{}, ...]

  """
  def list_credit_note_entries do
    Repo.all(CreditNoteEntries)
  end

  @doc """
  Gets a single credit_note_entries.

  Raises `Ecto.NoResultsError` if the Credit note entries does not exist.

  ## Examples

      iex> get_credit_note_entries!(123)
      %CreditNoteEntries{}

      iex> get_credit_note_entries!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit_note_entries!(id), do: Repo.get!(CreditNoteEntries, id)

  @doc """
  Creates a credit_note_entries.

  ## Examples

      iex> create_credit_note_entries(%{field: value})
      {:ok, %CreditNoteEntries{}}

      iex> create_credit_note_entries(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit_note_entries(attrs \\ %{}) do
    %CreditNoteEntries{}
    |> CreditNoteEntries.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit_note_entries.

  ## Examples

      iex> update_credit_note_entries(credit_note_entries, %{field: new_value})
      {:ok, %CreditNoteEntries{}}

      iex> update_credit_note_entries(credit_note_entries, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit_note_entries(%CreditNoteEntries{} = credit_note_entries, attrs) do
    credit_note_entries
    |> CreditNoteEntries.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CreditNoteEntries.

  ## Examples

      iex> delete_credit_note_entries(credit_note_entries)
      {:ok, %CreditNoteEntries{}}

      iex> delete_credit_note_entries(credit_note_entries)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit_note_entries(%CreditNoteEntries{} = credit_note_entries) do
    Repo.delete(credit_note_entries)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit_note_entries changes.

  ## Examples

      iex> change_credit_note_entries(credit_note_entries)
      %Ecto.Changeset{source: %CreditNoteEntries{}}

  """
  def change_credit_note_entries(%CreditNoteEntries{} = credit_note_entries) do
    CreditNoteEntries.changeset(credit_note_entries, %{})
  end
end
