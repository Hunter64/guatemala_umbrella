defmodule Guatemala.EmailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Guatemala.Emails` context.
  """

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        active: true,
        catalog_id: 42,
        creator_user_id: 42,
        email: "some email",
        modifier_user_id: 42,
        owner_id: 42
      })
      |> Guatemala.Emails.create_email()

    email
  end
end
