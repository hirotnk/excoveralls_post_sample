defmodule Umbrella1App1Test do
  use ExUnit.Case
  doctest Umbrella1App1

  test "add" do
    assert Umbrella1App1.add(1, 2) == 3
  end

  test "sub" do
    assert Umbrella1App1.sub(1, 2) == -1
  end
end
