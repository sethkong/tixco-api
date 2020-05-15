defmodule Tixco.Twilio.SmsSender do
    def send_test_sms() do
        {target_number,
        twilio_number,
        body} = {"+19805052228", "+19167943541", "Hello World!"}
        ExTwilio.Message.create(
            to: target_number,
            from: twilio_number,
            body: body
        )
    end
end
