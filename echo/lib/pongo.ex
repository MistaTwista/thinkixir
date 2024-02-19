defmodule Echo.Pongo do
  use GenServer
  @moduledoc """
  отвечаем на синхронные запросы в ping
  """

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, []}
  end

  # метод проверки дерева супервизора, нет функции для :shoot_me
  # процесс завалится
  def shoot_me(pid) do
    GenServer.call(pid, :shoot_me)
  end

  def ping(pid) do
    GenServer.call(pid, :ping)
  end

  def handle_call(:ping, _from, state) do
    IO.puts("pongo")
    {:reply, :pong, state}
  end
end
