defmodule Producer do
  use GenServer
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
    :timer.send_interval(2000, :something)
    {:ok, {}}
  end

  @impl true
  def handle_info(:something, state) do
    Logger.info("hello")
    {:noreply, state}
  end

  @impl true
  def handle_call({:hello, greeting}, _from, _state) do
    Logger.info("sup: #{greeting}")
  end

end
