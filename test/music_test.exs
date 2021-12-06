defmodule MusicTest do
  use ExUnit.Case
  doctest Music

  test "greets the world" do
    assert Music.hello() == :world
  end
end
