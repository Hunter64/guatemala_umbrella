defmodule Guatemala.DocumentTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.DocumentTypes` context.
  """

  @doc """
  Generate a document_type.
  """
  def document_type_fixture(attrs \\ %{}) do
    {:ok, document_type} =
      attrs
      |> Enum.into(%{
        active: true,
        creator_user_id: 42,
        description: "some description",
        modifier_user_id: 42,
        name: "some name"
      })
      |> Guatemala.DocumentTypes.create_document_type()

    document_type
  end
end
