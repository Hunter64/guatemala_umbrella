defmodule GuatemalaWeb.HomeComponent do
  @moduledoc """
  Componente Home
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="flex justify-center ml-96 mt-80">
        <img src="/images/logo-guatemala.png" />
      </div>
    """
  end

end
