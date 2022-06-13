defmodule GuatemalaWeb.PageController do
  use GuatemalaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
