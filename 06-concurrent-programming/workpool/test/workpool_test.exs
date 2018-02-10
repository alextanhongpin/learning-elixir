defmodule WorkpoolTest do
  use ExUnit.Case
  doctest Workpool

  test "greets the world" do
    assert Workpool.hello() == :world
  end
end
