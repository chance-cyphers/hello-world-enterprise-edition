defmodule Producer do
  use GenServer
#  import Ecto
  require Logger

  #  client

  def start_link() do
    GenServer.start_link(__MODULE__, {:name})
  end

  def say_hello(server, greeting) do
    GenServer.call(server, {:hello, greeting})
  end

  #  server

  @impl true
  def init(_opts) do
    Logger.info("starting producer")
    :timer.send_interval(2000, :something)
    {:ok, {}}
  end

  @impl true
  def handle_info(:something, state) do
    :mnesia.dirty_write({Hello, make_ref(), "helloozzo"})
    {:noreply, state}
  end

  @impl true
  def handle_call({:hello, greeting}, _from, _state) do
    Logger.info("sup: #{greeting}")
  end

end
