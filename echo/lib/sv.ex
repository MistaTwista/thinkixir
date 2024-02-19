defmodule Echo.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      {Echo.Echo, [name: Echoer]},
      {Echo.Pingo, [name: Pingo]},
      {Echo.Pongo, [name: Pongo]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
