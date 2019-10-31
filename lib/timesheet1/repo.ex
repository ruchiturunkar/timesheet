defmodule Timesheet1.Repo do
  use Ecto.Repo,
    otp_app: :timesheet1,
    adapter: Ecto.Adapters.Postgres
end
