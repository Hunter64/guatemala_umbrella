defmodule Guatemala.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :active, :boolean, default: false
    field :catalog_id, :integer
    field :code, :string
    field :creator_user_id, :integer
    field :description, :string
    field :discount_id, :integer
    field :modifier_user_id, :integer
    field :price_id, :integer
    field :product_type_id, :integer
    field :provider_id, :integer
    field :stock_id, :integer
    field :trademark_id, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:catalog_id, :product_type_id, :price_id, :discount_id, :stock_id, :provider_id, :trademark_id, :code, :description, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:catalog_id, :product_type_id, :price_id, :discount_id, :stock_id, :provider_id, :trademark_id, :code, :description, :active, :creator_user_id, :modifier_user_id])
  end
end
