defmodule Guatemala.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        active: true,
        catalog_id: 42,
        code: "some code",
        creator_user_id: 42,
        description: "some description",
        discount_id: 42,
        modifier_user_id: 42,
        price_id: 42,
        product_type_id: 42,
        provider_id: 42,
        stock_id: 42,
        trademark_id: 42
      })
      |> Guatemala.Products.create_product()

    product
  end
end
