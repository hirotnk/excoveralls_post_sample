defmodule Umbrella1App2Test do
  use ExUnit.Case
  doctest Umbrella1App2

  test "multiply" do
    assert Umbrella1App2.multiply(2, 3) == 6
  end
end
