defmodule Tixco.UserTest do
  use Tixco.DataCase

  alias Tixco.Account
  alias Tixco.Account.User
  alias Tixco.UserFixture 
  
  describe "users" do
    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(UserFixture.valid_attrs())
      test_user = UserFixture.valid_attrs()
      assert user.email == test_user.email
      assert user.password ==test_user.password
      assert user.first_name == test_user.first_name
      assert user.last_name == test_user.last_name
      assert user.phone == test_user.phone
      assert user.is_phone_verified == test_user.is_phone_verified
      assert user.is_email_verified == test_user.is_email_verified
      assert user.is_locked == test_user.is_locked
      assert user.username == test_user.username
      assert user.promo_code == test_user.promo_code
    end
  end
end
