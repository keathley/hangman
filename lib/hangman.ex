defmodule Hangman do
  use Application

  def start do
    import Supervisor.Spec

    children = [
      supervisor(Hangman.Game.Supervisor, []),
      supervisor(Registry, [:unique, Hangman.Registry]),
      worker(Hangman.Game.Interface, [])
    ]
  end

  def game(name) do
    {:via, Registry, {Hangman.Registry, name}}
  end
end
