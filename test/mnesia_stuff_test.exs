defmodule MnesiaStuffTest do
  use ExUnit.Case
  doctest MnesiaStuff

  test "greets the world" do
    assert MnesiaStuff.hello() == :world
  end
end
