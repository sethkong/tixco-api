defmodule Tixco.TemplateEmail do
  use Bamboo.Phoenix, view: TixcoWeb.MailerView

  def welcome_text_email(user) do
    new_email()
    |> to(user.email)
    |> from("sethkong@gmail.com")
    |> subject("Weclome TEXT!")
    |> text_body("Welcome to Tixco!")
    |> put_text_layout({TixcoWeb.LayoutView, "email.text"})
    |> render("welcome.text", user: user)
  end

  def welcome_html_email(user) do
    new_email()
    |> to(user.email)
    |> from("sethkong@gmail.com")
    |> subject("Weclome HTML!")
    |> html_body("<strong>Welcome</strong> to Tixco!")
    |> put_html_layout({TixcoWeb.LayoutView, "email.html"})
    |> render("welcome.html", user: user)
  end
end
