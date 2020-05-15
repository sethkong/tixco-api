defmodule Tixco.AccountFixture do
  alias Tixco.Account
  alias Tixco.Guardian
  alias Tixco.Account.User
  alias Tixco.FixtureHelper
  
  def create_user do
    user_params = %{
      email: FixtureHelper.rand_email(),
      password: "aloha123",
      password_confirmation: "aloha123"
    }
    with {:ok, %User{}  = user} <- Account.create_user(user_params),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
      %{jwt: token, user: user}
    end
  end

  def user_fixture(user_attrs, attrs \\ %{}) do
    {:ok, user} = attrs
      |>  Enum.into(user_attrs)
      |>  Account.create_user()
    user
  end
end
