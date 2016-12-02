defmodule Syrius.Router do

  use Plug.Router

  plug :match
  plug :dispatch

  forward "/api", to: Syrius.Api

  match _ do
    send_resp(conn, 404, "oops")
  end
end
