defmodule GuatemalaWeb.HomeView do
  use GuatemalaWeb, :view
end

defmodule GuatemalaWeb.HomeLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(GuatemalaWeb.HomeView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = (for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

end
