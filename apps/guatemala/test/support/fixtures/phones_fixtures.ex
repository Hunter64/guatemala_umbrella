defmodule Guatemala.PhonesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.Phones` context.
  """

  @doc """
  Generate a phone.
  """
  def phone_fixture(attrs \\ %{}) do
    {:ok, phone} =
      attrs
      |> Enum.into(%{
        active: true,
        catalog_id: 42,
        country_code: "some country_code",
        creator_user_id: 42,
        extension: "some extension",
        lada_code: "some lada_code",
        modifier_user_id: 42,
        number: "some number",
        owner_id: 42
      })
      |> Guatemala.Phones.create_phone()

    phone
  end
end
