defmodule Guatemala.Catalogs.Catalog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "catalogs" do
    field :active, :boolean, default: false
    field :creator_user_id, :integer
    field :description, :string
    field :modifier_user_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(catalog, attrs) do
    catalog
    |> cast(attrs, [:name, :description, :active, :creator_user_id, :modifier_user_id])
    |> validate_required([:name, :description, :active, :creator_user_id])
  end
end
