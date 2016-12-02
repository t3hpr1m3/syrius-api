defmodule Syrius.Api do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> send_resp(200, "Plug2!")
  end
end
