defmodule GuatemalaWeb.CreditTypeView do
  use GuatemalaWeb, :view
end

defmodule GuatemalaWeb.CreditTypeLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GuatemalaWeb.CreditTypeView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = (for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

  def handle_info({_reference, %{message: params}}, socket) do
    case params do
      "close_notification" -> send_update(GuatemalaWeb.NotificationComponent, id: "succesfully", show: false)
      "close_notification_error" -> send_update(GuatemalaWeb.NotificationComponent, id: "error", show: false)
      "close_notification_warning" -> send_update(GuatemalaWeb.NotificationComponent, id: "warning", show: false)
    end
    {:noreply, socket}
  end

  def handle_info({:DOWN, _reference, _process, _pid, _normal}, socket) do
    {:noreply, socket}
  end

end
