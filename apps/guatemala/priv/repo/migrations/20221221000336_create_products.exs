defmodule Guatemala.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :catalog_id, :integer, null: false
      add :product_type_id, :integer, null: false
      add :price_id, :integer, null: false
      add :discount_id, :integer
      add :stock_id, :integer, null: false
      add :provider_id, :integer, null: false
      add :trademark_id, :integer, null: false
      add :code, :string, size: 100
      add :description, :string, size: 255
      add :active, :boolean, default: false, null: false
      add :creator_user_id, :integer, null: false
      add :modifier_user_id, :integer

      timestamps()
    end
  end
end
