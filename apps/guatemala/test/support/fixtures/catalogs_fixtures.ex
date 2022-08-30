defmodule Guatemala.CatalogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.Catalogs` context.
  """

  @doc """
  Generate a catalog.
  """
  def catalog_fixture(attrs \\ %{}) do
    {:ok, catalog} =
      attrs
      |> Enum.into(%{
        active: true,
        creator_user_id: 42,
        description: "some description",
        modifier_user_id: 42,
        name: "some name"
      })
      |> Guatemala.Catalogs.create_catalog()

    catalog
  end
end
