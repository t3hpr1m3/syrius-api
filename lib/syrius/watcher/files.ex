defmodule Syrius.Watcher.Files do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get(container, key) do
    Agent.get(container, &Map.get(&1, key))
  end

  def put(container, key, value) do
    Agent.update(container, &Map.put(&1, key, value))
  end
end
