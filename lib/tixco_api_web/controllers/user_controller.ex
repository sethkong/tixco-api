defmodule TixcoWeb.UserController do
  use TixcoWeb, :controller
  require Logger

  alias Tixco.{Account, Guardian}
  alias Tixco.Account.User

  action_fallback TixcoWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Account.create_user(user_params),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
      conn |> render("login.json", %{jwt: token, user: user})
    end
  end

  def login(conn, %{"username" => username, "password" => password}) do
    case Account.token_login(username, password) do
      {:ok, token, claims} ->
        Logger.debug "cliams: #{inspect(claims)}"
        user = Account.get_user!(claims["sub"])
        Logger.debug "user: #{inspect(user)}"
        conn |> render("login.json", %{jwt: token, user: user})
      _ ->
        {:error, :unauthorized}
    end
  end
end
