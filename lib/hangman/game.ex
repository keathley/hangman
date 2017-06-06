defmodule Hangman.Game do
  @available_guesses 10

  def play(word), do: play(word, hint(word, []), [])

  def play(_, _progress, guesses) when length(guesses) > @available_guesses do
    IO.puts "Sorry you ran out of guesses"
  end
  def play(word, progress, guesses) when word != progress do
    IO.puts "Here is your word: #{progress}"
    IO.puts "You have #{@available_guesses - Enum.count(guesses)} guesses left"
    guess = IO.gets "What is your guess> "
    guess = String.strip(guess)
    {progress, guesses} = turn(word, guess, guesses)
    play(word, progress, guesses)
  end
  def play(_, _, guesses), do: IO.puts "You finished after #{Enum.count(guesses)} guesses"

  def turn(word, guess, guesses) do
    guesses = [guess | guesses]
    {hint(word, guesses), guesses}
  end

  def hint(word, guesses) do
    word
    |> String.graphemes
    |> Enum.map(& char_or_star(&1, found_char?(guesses, &1)) )
    |> Enum.join()
  end

  def char_or_star(char, found?) when found? == true, do: char
  def char_or_star(_, _), do: "*"

  def found_char?(guesses, char), do: Enum.any?(guesses, fn(guess) -> guess == char end)
end
