defmodule Tixco.EmailSender do
  alias Tixco.CustomEmail
  alias Tixco.Mailer

  def send() do
    CustomEmail.welcome_email |> Mailer.deliver_now()
  end
end
