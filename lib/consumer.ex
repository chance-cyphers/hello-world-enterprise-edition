defmodule Consumer do
  use GenServer
  require Logger

  #  client

  def start_link() do
    GenServer.start_link(__MODULE__, {:name})
  end

  #  server

  @impl true
  def init(_opts) do
    {:ok, _} = :mnesia.subscribe({:table, Hello, :simple})
    Logger.info("all subscribed")
    {:ok, {}}
  end

  @impl true
  def handle_info({:mnesia_table_event, {:write, {Hello, _ref, msg}, _}}, state) do
    Logger.info("msg from Hello: #{msg}")
    {:noreply, state}
  end

end