defmodule Syrius.Watcher do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, container} = Syrius.Watcher.Files.start_link([])
      {:noreply, Map.put(names, name, container)}
    end
  end
end
