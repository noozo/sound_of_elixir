defmodule Music.HappyBirthday do
  @behaviour Music.Melody

  @impl true
  def beats_per_minute, do: 160

  @impl true
  def sounds,
    do: [
      # Remove this if not running on windows (FFMPEG is a slow starter)
      {:silence, 7},
      #
      {:c4, 1.0},
      {:c4, 1.0},
      {:d4, 2.0},
      {:c4, 2.0},
      {:f4, 2.0},
      {:e4, 4.0},
      # #
      {:c4, 1.0},
      {:c4, 1.0},
      {:d4, 2.0},
      {:c4, 2.0},
      {:g4, 2.0},
      {:f4, 4.0},
      #
      {:c4, 1.0},
      {:c4, 1.0},
      {:c5, 2.0},
      {:a4, 2.0},
      {:f4, 2.0},
      {:e4, 2.0},
      {:d4, 4.0},
      #
      {:c5, 1.0},
      {:c5, 1.0},
      {:a4, 2.0},
      {:f4, 2.0},
      {:g4, 2.0},
      {:f4, 4.0}
    ]
end
