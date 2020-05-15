defmodule Tixco.Repo.Migrations.EntityTypes do
  use Ecto.Migration

  def change do
    create table(:entity_types, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :group_name, :string, size: 50, null: false
      add :name, :string, size: 50, null: false
      add :description, :string, size: 100, null: false
      add :is_active, :boolean, default: true, null: false
      add :is_deleted, :boolean, default: false
      add :changed_by_user_id, references(:users, on_delete: :nothing, type: :binary_id)
      
      timestamps()
    end

    create index(:entity_types, [:changed_by_user_id])
  end
end
