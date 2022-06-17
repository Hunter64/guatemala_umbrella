defmodule GuatemalaWeb.DocumentTypeComponent do
  @moduledoc """
    Componente Document Types
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="fixed w-full py-2 bg-amber-300 top-0 left-0 z-40 border-b-2 border-amber-300">

        <div class="flex">
          <img src="/images/logo-guatemala-re.png" class="w-56 ml-20"/>
        </div>

        <div class="fixed top-0 left-0 h-screen px-2 bg-amber-300 block z-30 shadow-lg transition-menu w-16">
          <div class="block h-16"></div>
        </div>

      </div>

    """
  end
end
