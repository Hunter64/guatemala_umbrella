defmodule Guatemala.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :catalog_id, :integer, null: false
      add :large_name, :string, size: 255
      add :first_name, :string, size: 100, null: false
      add :second_name, :string, size: 100
      add :first_surname, :string, size: 100, null: false
      add :second_surname, :string, size: 100
      add :credit_type_id, :integer, null: false
      add :rfc, :string, size: 20, null: false
      add :social_reason, :string, size: 255
      add :moral_person, :boolean, default: false, null: false
      add :comments, :string, size: 255
      add :active, :boolean, default: false, null: false
      add :creator_user_id, :integer, null: false
      add :modifier_user_id, :integer

      timestamps()
    end
  end
end
