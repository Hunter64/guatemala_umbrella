defmodule Guatemala.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :catalog_id, :integer, null: false
      add :owner_id, :integer, null: false
      add :country_code, :string, size: 10, null: false
      add :lada_code, :string, size: 10, null: false
      add :number, :string, size: 10, null: false
      add :extension, :string, size: 10
      add :active, :boolean, default: false, null: false
      add :creator_user_id, :integer, null: false
      add :modifier_user_id, :integer

      timestamps()
    end
  end
end
