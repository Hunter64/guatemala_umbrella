defmodule Guatemala.Repo do
  use Ecto.Repo,
    otp_app: :guatemala,
    adapter: Ecto.Adapters.Postgres
end
