defmodule Syrius.Watcher do
  use Supervisor

  @name Syrius.Watcher

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_watcher(directory) do
    Supervisor.start_child(@name, [[target: directory]])
  end

  def init(:ok) do
    Supervisor.init([Syrius.Watcher.Worker], strategy: :simple_one_for_one)
  end
end
