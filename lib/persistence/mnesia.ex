defmodule Persistence.Mnesia do
  def init() do
    :mnesia.create_schema([node()])
    :mnesia.start()

    :mnesia.create_table(Session, disc_copies: [node()], attributes: [:client_id, :expiry])
    :mnesia.create_table(Hello, disc_copies: [node()], attributes: [:id, :greeting])
  end
end
