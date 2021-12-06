defmodule Music do
  @pitch_standard 440.0
  @sample_rate 48000
  @ffplay_binary "ffmpeg/ffplay.exe"

  # @song Music.StarWarsMainTheme
  # @song Music.TheSoundOfSilence
  # @song Music.SuperMario
  # @song Music.SilenceTest
  @song Music.HappyBirthday

  def main do
    wave = wave()
    filename = Path.join(File.cwd!(), "out/first_wave.raw")
    save(filename, wave)
    play(filename)
  end

  defp wave do
    raw_sounds = @song.sounds()
    sounds = Enum.map(raw_sounds, fn {note, duration} -> sound(note, duration) end)
    List.flatten(sounds)
  end

  defp save(filename, wave) do
    content =
      :lists.foldl(
        fn element, acc ->
          <<acc::binary, element::float-32>>
        end,
        <<"">>,
        wave
      )

    :ok = File.write(filename, content)
  end

  defp play(filename) do
    command = Path.join(File.cwd!(), @ffplay_binary)

    System.cmd(
      command,
      [
        "-autoexit",
        "-fast",
        "-f",
        "f64be",
        "-ar",
        Integer.to_string(@sample_rate),
        filename
      ]
    )
  end

  defp frequency(hz, duration) do
    signals = 1..round(@sample_rate * duration)
    step = hz * :math.pi() / @sample_rate

    raw_output =
      Enum.map(signals, fn signal ->
        :math.sin(step * signal)
      end)

    output_length = length(raw_output)

    :lists.zipwith3(
      fn attack, release, out -> attack * release * out end,
      attack(output_length),
      release(output_length),
      raw_output
    )
  end

  defp get_tone(semitones) do
    twelfth_root_of_two = :math.pow(2, 1.0 / 12.0)
    @pitch_standard * :math.pow(twelfth_root_of_two, semitones)
  end

  defp beats_per_minute, do: @song.beats_per_minute()
  defp beat_duration, do: 60 / beats_per_minute()

  defp sound(note, beats),
    do: frequency(note(note), beats * beat_duration())

  defp note(:silence), do: 0

  defp note(note) do
    semitones_shift = semitones_shift(note)
    get_tone(semitones_shift)
  end

  defp semitones_shift(:c4), do: -9
  defp semitones_shift(:c4sharp), do: -8
  defp semitones_shift(:d4flat), do: -8
  defp semitones_shift(:d4), do: -7
  defp semitones_shift(:d4sharp), do: -6
  defp semitones_shift(:e4flat), do: -6
  defp semitones_shift(:e4), do: -5
  defp semitones_shift(:f4), do: -4
  defp semitones_shift(:f4sharp), do: -3
  defp semitones_shift(:g4flat), do: -3
  defp semitones_shift(:g4), do: -2
  defp semitones_shift(:g4sharp), do: -1
  defp semitones_shift(:a4flat), do: -1
  defp semitones_shift(:a4), do: 0
  defp semitones_shift(:a4sharp), do: 1
  defp semitones_shift(:b4flat), do: 1
  defp semitones_shift(:b4), do: 2
  defp semitones_shift(:c5), do: 3
  defp semitones_shift(:c5sharp), do: 4
  defp semitones_shift(:d5flat), do: 4
  defp semitones_shift(:d5), do: 5
  defp semitones_shift(:d5sharp), do: 6
  defp semitones_shift(:e5flat), do: 6
  defp semitones_shift(:e5), do: 7
  defp semitones_shift(:f5), do: 8
  defp semitones_shift(:f5sharp), do: 9
  defp semitones_shift(:g5flat), do: 9
  defp semitones_shift(:g5), do: 10
  defp semitones_shift(:g5sharp), do: 11
  defp semitones_shift(:a5flat), do: 11
  defp semitones_shift(:a5), do: 12

  defp attack(len),
    do: Enum.map(1..len, &min(&1 / 1000, 1))

  defp release(len),
    do: len |> attack() |> Enum.reverse()
end
