defmodule Tixco.Repo do
  use Ecto.Repo,
    otp_app: :tixco_api,
    adapter: Ecto.Adapters.Postgres
end
