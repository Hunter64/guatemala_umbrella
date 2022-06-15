defmodule GuatemalaWeb.HomeController do
  use GuatemalaWeb, :controller
  # alias GuatemalaWeb.UtilController
  alias Phoenix.LiveView

  def index(conn, _params) do
    # conn = conn.query_params
    #   |> UtilController.have_params?(conn)
    #   conn
    #   |> UtilController.get_sessions()
    #   |> case do
    #     nil -> conn |> redirect(to: "/error")
    #     session -> conn |> LiveView.Controller.live_render(GuatemalaWeb.HomeLiveView, session: session)
    #   end

    conn
      |> LiveView.Controller.live_render(GuatemalaWeb.HomeLiveView, session: %{})
  end

end
