defmodule Echo.Pingo do
  use GenServer
  @moduledoc """
  в цикле пигруем Pongo процесс
  """

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, []}
  end

  def run(pid) do
    GenServer.cast(pid, :run)
  end

  def handle_cast(:run, state) do
    ping()
    {:noreply, state}
  end

  defp ping() do
    IO.puts("pingo")
    Echo.Pongo.ping(Process.whereis(Pongo))
    Process.sleep(5000)
    ping()
  end
end
