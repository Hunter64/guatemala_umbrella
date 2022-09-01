defmodule Guatemala.CreditTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.CreditTypes` context.
  """

  @doc """
  Generate a credit_type.
  """
  def credit_type_fixture(attrs \\ %{}) do
    {:ok, credit_type} =
      attrs
      |> Enum.into(%{
        active: true,
        creator_user_id: 42,
        description: "some description",
        modifier_user_id: 42,
        name: "some name"
      })
      |> Guatemala.CreditTypes.create_credit_type()

    credit_type
  end
end
