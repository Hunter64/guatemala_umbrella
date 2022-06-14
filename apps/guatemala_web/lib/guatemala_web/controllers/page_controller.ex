defmodule GuatemalaWeb.PageController do
  use GuatemalaWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    #render(conn, "index.html")
    conn
      |> LiveView.Controller.live_render(GuatemalaWeb.PageLiveView, session: %{})
  end
end
