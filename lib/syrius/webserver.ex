defmodule Syrius.Webserver do
  require Logger

  defmodule Router do

    use Plug.Router

    plug :match
    plug :dispatch

    forward "/api", to: Syrius.Routes.Api

    match _ do
      send_resp(conn, 404, "oops")
    end
  end

  def start_link do
    port = String.to_integer(Application.fetch_env!(:syrius, :port))
    {:ok, _} = Plug.Adapters.Cowboy.http(Syrius.Webserver.Router, [port: port])
  end
end
