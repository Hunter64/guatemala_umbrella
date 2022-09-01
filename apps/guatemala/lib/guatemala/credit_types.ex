defmodule Guatemala.CreditTypes do
  @moduledoc """
  The CreditTypes context.
  """

  import Ecto.Query, warn: false
  alias Guatemala.Repo

  alias Guatemala.CreditTypes.CreditType

  @doc """
  Returns the list of credit_types.

  ## Examples

      iex> list_credit_types()
      [%CreditType{}, ...]

  """
  def list_credit_types do
    Repo.all(CreditType)
  end

  @doc """
  Gets a single credit_type.

  Raises `Ecto.NoResultsError` if the Credit type does not exist.

  ## Examples

      iex> get_credit_type!(123)
      %CreditType{}

      iex> get_credit_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit_type!(id), do: Repo.get!(CreditType, id)

  @doc """
  Creates a credit_type.

  ## Examples

      iex> create_credit_type(%{field: value})
      {:ok, %CreditType{}}

      iex> create_credit_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit_type(attrs \\ %{}) do
    %CreditType{}
    |> CreditType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit_type.

  ## Examples

      iex> update_credit_type(credit_type, %{field: new_value})
      {:ok, %CreditType{}}

      iex> update_credit_type(credit_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit_type(%CreditType{} = credit_type, attrs) do
    credit_type
    |> CreditType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a credit_type.

  ## Examples

      iex> delete_credit_type(credit_type)
      {:ok, %CreditType{}}

      iex> delete_credit_type(credit_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit_type(%CreditType{} = credit_type) do
    Repo.delete(credit_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit_type changes.

  ## Examples

      iex> change_credit_type(credit_type)
      %Ecto.Changeset{data: %CreditType{}}

  """
  def change_credit_type(%CreditType{} = credit_type, attrs \\ %{}) do
    CreditType.changeset(credit_type, attrs)
  end
end
