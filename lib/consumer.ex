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
    {:ok, {}}
  end

end
