defmodule TixcoWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use TixcoWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(TixcoWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(TixcoWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unauthorized}) do 
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Invalid username or password"})
  end
end
