defmodule Tixco.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :phone, :string
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :first_name, :string
    field :last_name, :string
    field :is_phone_verified, :boolean, default: false
    field :is_email_verified, :boolean, default: false
    field :is_locked, :boolean, default: false
    field :is_active, :boolean, default: true
    field :promo_code, :string
    
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :phone, :username, :password,
      :password_confirmation, :first_name, :last_name,
      :is_phone_verified, :is_email_verified, :is_locked, :is_active, :promo_code])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]+$/)
    |> validate_length(:password, min: 8)
    |> validate_length(:first_name, max: 50)
    |> validate_length(:last_name, max: 50)
    |> validate_length(:username, min: 5)
    |> validate_length(:promo_code, max: 10)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
      case changeset do
        %Ecto.Changeset{valid?: true, changes: %{password: passwd}} ->
          put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(passwd))
        _ ->
          changeset
      end
  end
end
