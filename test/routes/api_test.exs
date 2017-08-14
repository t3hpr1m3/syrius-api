defmodule Syrius.Routes.ApiTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "/ returns 200 (ok)" do
    response = conn(:get, "/") |> send_request
    assert response.status == 200
    assert String.match?(response.resp_body, ~r/Plug2\!/)
  end

  defp send_request(conn) do
    conn
    |> Syrius.Routes.Api.call([])
  end
end
