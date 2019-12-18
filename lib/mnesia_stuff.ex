defmodule MnesiaStuff do
  require Logger

  def start(_type, _args) do
    Logger.info("starting up")

    Persistence.Mnesia.init()
    {:ok, _pid} = Producer.start_link()
    {:ok, _pid} = Consumer.start_link()

    {:ok, self()}
  end

end
