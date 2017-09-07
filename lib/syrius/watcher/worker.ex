defmodule Syrius.Watcher.Worker do
  use GenServer
  require Logger

  def start_link(_, args) do
    {opts, _} = Keyword.split(args, [:target])
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    {:ok, %{}}
    # {target, rest} = Keyword.pop(args, :target)
    # Logger.debug("Starting worker for #{target}")
  end
end
