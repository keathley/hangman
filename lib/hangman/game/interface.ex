defmodule Hangman.Game.Interface do
  use GenServer

  def play() do

  end

  def start_link(game_name, word) do
    GenServer.start_link(__MODULE__, {game_name, word}, name: game_id(game_name))
  end

  def init({game_name, word}) do
    {:ok, %{game_name: game_name, word: word}}
  end

  defp game_name(name), do: Hangman.game(name)
end
