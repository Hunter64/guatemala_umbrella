defmodule Guatemala.CreditTypes.CreditType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_types" do
    field :active, :boolean, default: false
    field :creator_user_id, :integer
    field :description, :string
    field :modifier_user_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(credit_type, attrs) do
    credit_type
    |> cast(attrs, [:name, :description, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:name, :description, :active, :creator_user_id])
  end
end
