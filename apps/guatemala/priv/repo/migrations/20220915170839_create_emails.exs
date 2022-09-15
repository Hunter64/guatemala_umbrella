defmodule Guatemala.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :catalog_id, :integer, null: false
      add :owner_id, :integer, null: false
      add :email, :string, size: 255, null: false
      add :active, :boolean, default: false, null: false
      add :creator_user_id, :integer, null: false
      add :modifier_user_id, :integer

      timestamps()
    end
  end
end
