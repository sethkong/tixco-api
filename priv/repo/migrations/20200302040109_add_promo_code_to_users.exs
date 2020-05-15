defmodule Tixco.Repo.Migrations.AddPromoCodeToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do 
      add :promo_code, :string, size: 10
    end
  end
end
