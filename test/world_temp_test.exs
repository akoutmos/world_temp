defmodule WorldTempTest do
  use ExUnit.Case
  doctest WorldTemp

  test "greets the world" do
    assert WorldTemp.hello() == :world
  end
end
