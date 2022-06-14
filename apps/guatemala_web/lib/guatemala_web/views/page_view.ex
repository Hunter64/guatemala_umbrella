defmodule GuatemalaWeb.PageView do
  use GuatemalaWeb, :view
end

defmodule GuatemalaWeb.PageLiveView do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GuatemalaWeb.PageView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = (for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

end
