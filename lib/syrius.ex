defmodule Syrius do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Syrius.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Syrius]
    Supervisor.start_link(children, opts)
  end
end
