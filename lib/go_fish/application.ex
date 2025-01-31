defmodule GoFish.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application



  @impl true
  def start(_type, _args) do

    child_spec = [
      # Starts a worker by calling: GoFish.Worker.start_link(arg)
      {GoFish.Ocean, []},
      {GoFish.Controller, []},
      Supervisor.child_spec({GoFish.Player, {:john, true}}, id: :john),
      Supervisor.child_spec({GoFish.Player, {:simon, false}}, id: :simon)

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: GoFish.Supervisor]
    Supervisor.start_link(child_spec, opts)
  end
end
