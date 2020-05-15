defmodule Tixco.Repo.Migrations.CreatePromoCodes do
  use Ecto.Migration

  def change do
     create table(:promo_codes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string, size: 10, null: false
      add :amount, :decimal, precision: 10, scale: 4
      add :percentage, :decimal, precision: 10, scale: 2
      add :valid_from, :utc_datetime, null: false
      add :expire_at, :utc_datetime
      add :redeemed_count, :integer
      add :max_num_of_redeeption, :integer
      add :is_active, :boolean, default: true, null: false
      add :is_deleted, :boolean, default: false
      add :changed_by_user_id, references(:users, on_delete: :nothing, type: :binary_id)
      
      timestamps()
    end

    create index(:promo_codes, [:changed_by_user_id])
  end
end
