defmodule Guatemala.Phones.Phone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "phones" do
    field :active, :boolean, default: false
    field :catalog_id, :integer
    field :country_code, :string
    field :creator_user_id, :integer
    field :extension, :string
    field :lada_code, :string
    field :modifier_user_id, :integer
    field :number, :string
    field :owner_id, :integer

    timestamps()
  end

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, [:catalog_id, :owner_id, :country_code, :lada_code, :number, :extension, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:catalog_id, :owner_id, :country_code, :lada_code, :number, :active, :creator_user_id])
  end
end
