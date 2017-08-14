defmodule Syrius.Routes.Api do
  use Plug.Router
  require Logger

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> send_resp(200, "Plug2!")
  end
end
