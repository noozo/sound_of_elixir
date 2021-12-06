defmodule Music.TheSoundOfSilence do
  @behaviour Music.Melody

  @impl true
  def beats_per_minute, do: 120

  @impl true
  def sounds,
    do: [
      {:e4, 0.5},
      {:e4, 0.5},
      {:g4, 0.5},
      {:g4, 0.5},
      {:b4, 0.5},
      {:a4, 4},
      {:d4, 0.5},
      {:d4, 0.5},
      {:d4, 0.5},
      {:f4, 0.5},
      {:f4, 0.5},
      {:a4, 0.5},
      {:a4, 0.5},
      {:g4, 4},
      {:g4, 0.5},
      {:g4, 0.5},
      {:b4, 0.5},
      {:b4, 0.5},
      {:d4, 0.5},
      {:d4, 0.5},
      {:e4, 1},
      {:e4, 0.5},
      {:d4, 2},
      {:g4, 0.5},
      {:g4, 0.5},
      {:b4, 0.5},
      {:b4, 0.5},
      {:d4, 0.5},
      {:d4, 0.5},
      {:e4, 1},
      {:e4, 0.5},
      {:d4, 2}
    ]
end
