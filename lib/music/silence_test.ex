defmodule Music.SilenceTest do
  @behaviour Music.Melody

  @impl true
  def beats_per_minute, do: 60

  @impl true
  def sounds,
    do: [
      {:silence, 4},
      {:b4, 0.5},
      {:silence, 4},
      {:g4, 4},
      {:silence, 4},
      {:d4, 0.5}
    ]
end
