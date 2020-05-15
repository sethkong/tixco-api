defmodule Tixco.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :phone, :string, size: 25
      add :password_hash, :string
      add :username, :string, size: 50
      add :first_name, :string, size: 50
      add :last_name, :string, size: 50
      add :is_phone_verified, :boolean, default: false
      add :is_email_verified, :boolean, default: false
      add :is_active, :boolean, default: true
      add :is_locked, :boolean, default: false

      timestamps()
    end

    create unique_index(:users, [:email, :phone])
  end
end
