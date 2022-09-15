defmodule Guatemala.Emails.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field :active, :boolean, default: false
    field :catalog_id, :integer
    field :creator_user_id, :integer
    field :email, :string
    field :modifier_user_id, :integer
    field :owner_id, :integer

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:catalog_id, :owner_id, :email, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:catalog_id, :owner_id, :email, :active, :creator_user_id])
  end
end
