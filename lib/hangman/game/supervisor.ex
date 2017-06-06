defmodule Hangman.Game.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def start_game(word) do
    Supervisor.start_child(__MODULE__, word)
  end

  def init([]) do
    children = [
      worker(Hangman.Game, [], restart: :transient)
    ]

    Supervisor.start_link(children, strategy: :simple_one_for_one)
  end
end
