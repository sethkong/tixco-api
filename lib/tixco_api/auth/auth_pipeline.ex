defmodule Tixco.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :tixco_api,
      module: Tixco.Guardian,
      error_handler: Tixco.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource
end
