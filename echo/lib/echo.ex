defmodule Echo.Echo do
  use GenServer
  @moduledoc """
  эхо сервер; получает сообщение :ping и высылает обратно туплу {:pong, node()}
  """

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, []}
  end

  def shoot_me(pid) do
    GenServer.call(pid, :shoot_me)
  end

  def ping(pid) do
    GenServer.call(pid, :ping)
  end

  def handle_call(:ping, _from, state) do
    {:reply, {:pong, node()}, state}
  end
end
