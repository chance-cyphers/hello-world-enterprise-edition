defmodule MnesiaStuff do
  require Logger

  def start(_type, _args) do
    Logger.info("starting up")
    Persistence.Mnesia.init()
    Logger.info("iknitted the stuff")
    {:ok, self()}
  end

end
