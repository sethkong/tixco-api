defmodule TixcoWeb.UserViewTest do
  use TixcoWeb.ConnCase, async: true

  alias TixcoWeb.UserView

  test "login.json renders user and token", %{jwt: jwt, user: user} do
    %{data: data } = UserView.render("login.json", %{jwt: jwt, user: user})
    assert data != nil
    assert data.token == jwt
    assert data.id == user.id
    assert data.email == user.email
    assert data.first_name == user.first_name
    assert data.last_name == user.last_name
    assert data.username == user.username
    assert data.is_active == user.is_active
    assert data.is_locked == user.is_locked
    assert data.is_email_verified == user.is_email_verified
    assert data.is_phone_verified == user.is_phone_verified
    assert data.promo_code == user.promo_code
  end  
end
