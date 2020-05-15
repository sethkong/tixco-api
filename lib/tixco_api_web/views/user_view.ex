defmodule TixcoWeb.UserView do
  use TixcoWeb, :view

  alias TixcoWeb.UserView

  def render("login.json", %{jwt: jwt, user: user}) do
    new_user = user |> Map.put(:jwt, jwt)
    %{data: render_one(new_user, UserView, "user_jwt.json")}
  end

  def render("user_jwt.json", %{user: user}) do
    %{token: user.jwt,
      id: user.id,
      email: user.email,
      phone: user.phone,
      first_name: user.first_name,
      last_name: user.last_name,
      username: user.username,
      is_active: user.is_active,
      is_locked: user.is_locked,
      is_email_verified: user.is_email_verified,
      is_phone_verified: user.is_phone_verified,
      promo_code: user.promo_code
    }
  end

end
