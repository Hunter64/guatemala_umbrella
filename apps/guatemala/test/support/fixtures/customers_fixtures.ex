defmodule Guatemala.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        active: true,
        catalog_id: 42,
        comments: "some comments",
        creator_user_id: 42,
        credit_type_id: 42,
        first_name: "some first_name",
        first_surname: "some first_surname",
        large_name: "some large_name",
        modifier_user_id: 42,
        moral_person: true,
        rfc: "some rfc",
        second_name: "some second_name",
        second_surname: "some second_surname",
        social_reason: "some social_reason"
      })
      |> Guatemala.Customers.create_customer()

    customer
  end
end
