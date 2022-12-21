defmodule GuatemalaWeb.ProductView do
  use GuatemalaWeb, :view
end

defmodule GuatemalaWeb.ProductLiveView do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GuatemalaWeb.ProductView, "index.html", assigns)
  end

  def mount(_parmas, session, socket) do
    session = (for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})
    {:ok, assign(socket, session: session)}
  end

end
