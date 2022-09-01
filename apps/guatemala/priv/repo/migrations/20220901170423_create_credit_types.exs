defmodule Guatemala.Repo.Migrations.CreateCreditTypes do
  use Ecto.Migration

  def change do
    create table(:credit_types) do
      add :name, :string, size: 100, null: false
      add :description, :string, size: 255, null: false
      add :active, :boolean, default: false, null: false
      add :creator_user_id, :integer, null: false
      add :modifier_user_id, :integer

      timestamps()
    end
  end
end
