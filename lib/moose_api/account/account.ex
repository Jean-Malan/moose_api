defmodule MooseApi.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias MooseApi.Repo

  alias MooseApi.Account.BankAccount

  @doc """
  Returns the list of bank_account.

  ## Examples

      iex> list_bank_account()
      [%BankAccount{}, ...]

  """
  def list_bank_account do
    Repo.all(BankAccount)
  end

  @doc """
  Gets a single bank_account.

  Raises `Ecto.NoResultsError` if the Bank account does not exist.

  ## Examples

      iex> get_bank_account!(123)
      %BankAccount{}

      iex> get_bank_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bank_account!(id), do: Repo.get!(BankAccount, id)

  @doc """
  Creates a bank_account.

  ## Examples

      iex> create_bank_account(%{field: value})
      {:ok, %BankAccount{}}

      iex> create_bank_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bank_account(attrs \\ %{}) do
    %BankAccount{}
    |> BankAccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bank_account.

  ## Examples

      iex> update_bank_account(bank_account, %{field: new_value})
      {:ok, %BankAccount{}}

      iex> update_bank_account(bank_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bank_account(%BankAccount{} = bank_account, attrs) do
    bank_account
    |> BankAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BankAccount.

  ## Examples

      iex> delete_bank_account(bank_account)
      {:ok, %BankAccount{}}

      iex> delete_bank_account(bank_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bank_account(%BankAccount{} = bank_account) do
    Repo.delete(bank_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bank_account changes.

  ## Examples

      iex> change_bank_account(bank_account)
      %Ecto.Changeset{source: %BankAccount{}}

  """
  def change_bank_account(%BankAccount{} = bank_account) do
    BankAccount.changeset(bank_account, %{})
  end

  alias MooseApi.Account.GlAccount

  @doc """
  Returns the list of gl_account.

  ## Examples

      iex> list_gl_account()
      [%GlAccount{}, ...]

  """
  def list_gl_account(id) do
    gl_accounts = from gla in GlAccount, where: gla.user_id == ^id

    gl_accounts
    |> Repo.all
    |> Repo.preload(:user)
    Repo.all(GlAccount)
  end

  @doc """
  Gets a single gl_account.

  Raises `Ecto.NoResultsError` if the Gl account does not exist.

  ## Examples

      iex> get_gl_account!(123)
      %GlAccount{}

      iex> get_gl_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gl_account!(id), do: Repo.get!(GlAccount, id)

  @doc """
  Creates a gl_account.

  ## Examples

      iex> create_gl_account(%{field: value})
      {:ok, %GlAccount{}}

      iex> create_gl_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gl_account(attrs \\ %{}) do
    %GlAccount{}
    |> GlAccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gl_account.

  ## Examples

      iex> update_gl_account(gl_account, %{field: new_value})
      {:ok, %GlAccount{}}

      iex> update_gl_account(gl_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gl_account(%GlAccount{} = gl_account, attrs) do
    gl_account
    |> GlAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GlAccount.

  ## Examples

      iex> delete_gl_account(gl_account)
      {:ok, %GlAccount{}}

      iex> delete_gl_account(gl_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gl_account(%GlAccount{} = gl_account) do
    Repo.delete(gl_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gl_account changes.

  ## Examples

      iex> change_gl_account(gl_account)
      %Ecto.Changeset{source: %GlAccount{}}

  """
  def change_gl_account(%GlAccount{} = gl_account) do
    GlAccount.changeset(gl_account, %{})
  end
end
