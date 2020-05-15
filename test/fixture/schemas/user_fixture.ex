defmodule Tixco.UserFixture do 
  def valid_attrs() do 
    %{
      email: "test123@gmail.com", 
      password: "some password_hash",
      password_confirmation: "some password_hash",
      first_name: "some first name",
      last_name: "some last name",
      phone: "70450522228",
      is_phone_verified: true, 
      is_email_verified: true,
      is_locked: false,
      username: "test123",
      promo_code: "1234code"
    }
  end 

  def update_attrs() do 
    %{
      email: "test@gmail.com", 
      password: "some updated password_hash",
      password_confirmation: "some updated password_hash",
      first_name: "some updated first name",
      last_name: "some updated last name",
      phone: "70450522255",
      is_phone_verified: false, 
      is_email_verified: false,
      is_locked: true,
      username: "test123",
      promo_code: "5555code"
    }
  end 

  def invalid_attrs() do 
    %{
      email: nil, 
      password: nil,
      password_confirmation: nil,
      first_name: nil,
      last_name: nil,
      phone: nil,
      is_phone_verified: nil,
      is_email_verified: nil,
      is_locked: nil,
      username: nil,
      promo_code: nil
    }
  end 
end 
