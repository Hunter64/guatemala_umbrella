defmodule GuatemalaWeb.DocumentTypeView do
  use GuatemalaWeb, :view
end

defmodule GuatemalaWeb.DocumentTypeLiveView do

  use Phoenix.LiveView

  def render(assigns) do
    IO.puts("------------------------> ARRIVED HERE ??? ")
    Phoenix.View.render(GuatemalaWeb.DocumentTypeView, "index.html", assigns)
  end

  def mount(_params, session, socket) do
    session = (for {key, val} <- session, into: %{}, do: {String.to_atom(key), val})

      {:ok, assign(socket,
      session: session
      )}
  end

end
