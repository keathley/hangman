defmodule Hangman.Dictionary do
  def word() do
    "/usr/share/dict/words"
    |> File.stream!()
    |> Enum.random()
    |> String.strip()
  end
end
