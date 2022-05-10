defmodule ElixirPhoenixQuickstart.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_quickstart,
    adapter: Ecto.Adapters.Postgres
end
