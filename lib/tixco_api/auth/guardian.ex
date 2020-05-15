defmodule Tixco.Guardian do
    use Guardian, otp_app: :tixco_api

    def subject_for_token(user, _claims) do
      sub = to_string(user.id)
      {:ok, sub}
    end
    def subject_for_token(), do: {:error, :reason_for_error}

    def resource_from_claims(claims) do
      id = claims["sub"]
      resource = Tixco.Account.get_user!(id)
      {:ok, resource}
    end
    def resource_from_claims(), do: {:error, :reason_for_error}
end
