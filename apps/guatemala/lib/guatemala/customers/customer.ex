defmodule Guatemala.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :active, :boolean, default: false
    field :catalog_id, :integer
    field :comments, :string
    field :creator_user_id, :integer
    field :credit_type_id, :integer
    field :first_name, :string
    field :first_surname, :string
    field :large_name, :string
    field :modifier_user_id, :integer
    field :moral_person, :boolean, default: false
    field :rfc, :string
    field :second_name, :string
    field :second_surname, :string
    field :social_reason, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:catalog_id, :large_name, :first_name, :second_name, :first_surname, :second_surname, :credit_type_id, :rfc, :social_reason, :moral_person, :comments, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:catalog_id, :large_name, :first_name, :first_surname, :credit_type_id, :rfc, :social_reason, :moral_person, :active, :creator_user_id])
  end
end
