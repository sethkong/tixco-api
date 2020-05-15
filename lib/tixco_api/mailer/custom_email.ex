defmodule Tixco.CustomEmail do
  import Bamboo.Email

  def welcome_email do
    new_email(
      to: "sk172online@gmail.com",
      from: "sethkong@gmail.com",
      subject: "Welcome!",
      html_body: "<strong>Weclome</strong>",
      text_body: "Test text"
    )
  end
end
