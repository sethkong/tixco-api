defmodule Tixco.Account do

  import Ecto.Query, warn: false

  alias Tixco.Repo
  alias Tixco.Account.User
  alias Tixco.Guardian

  defp get_by_username(username) when is_binary(username) do
    query = from u in User,
      where: u.email == ^username,
      or_where: u.phone == ^username,
      or_where: u.username == ^username
    
    case Repo.one(query) do 
      nil ->
        Pbkdf2.no_user_verify()
        {:error, :invalid_login}
      user ->
        {:ok, user}
    end
  end

  def verify_password(password, %User{} = user) when is_binary(password) do
    if Pbkdf2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_login}
    end
  end

  def account_auth(username, password) when is_binary(username) and is_binary(password) do
    with {:ok, user} <- get_by_username(username),
      do: verify_password(password, user)
  end

  def token_login(username, password) do
    case account_auth(username, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user)
      _ ->
        {:error, :unauthorized}
    end
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
