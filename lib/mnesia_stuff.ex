defmodule MnesiaStuff do
  require Logger

  def start(_type, _args) do
    name = System.get_env("APP_NAME") || ""
    :net_kernel.start([String.to_atom(name), :shortnames])

    Persistence.Mnesia.init()
    Process.sleep(1000)

    case name do
      "consumer" -> {:ok, _pid} = Consumer.start_link()
      "producer" -> {:ok, _pid} = Producer.start_link()
      _ -> Logger.error("didnt name the app right")
    end

    {:ok, self()}
  end

end
