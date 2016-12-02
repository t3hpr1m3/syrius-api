defmodule Syrius do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = String.to_integer(Application.fetch_env!(:syrius, :port))

    IO.puts "port: #{port}"

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Syrius.Router, [], [port: port])
    ]

    opts = [strategy: :one_for_one, name: Syrius.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
