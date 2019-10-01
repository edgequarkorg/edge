defmodule Edge.Repo do
  use Ecto.Repo,
    otp_app: :edge,
    adapter: Ecto.Adapters.Postgres
end
