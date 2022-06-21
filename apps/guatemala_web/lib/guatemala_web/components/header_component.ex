defmodule GuatemalaWeb.HeaderComponent do
  @moduledoc """
  Componente Home
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, assign(socket, menu: get_menu())}
  end

  def update(_attrs, socket) do
    {:ok, assign(socket,
      menu: get_menu()
    )}
  end

  def render(assigns) do
    ~H"""
      <div class="fixed w-full py-2 bg-amber-300 dark:bg-slate-800 top-0 left-0 z-40 border-b-2 border-amber-300">

        <div class="flex">
          <img src="/images/logo-guatemala-re.png" class="w-56 ml-20"/>
        </div>

        <div class="fixed top-0 left-0 h-screen px-2 bg-amber-300 dark:bg-slate-800 block z-30 shadow-lg transition-menu w-16">
          <div class="block h-16"></div>
          <%= for item <- @menu do %>
            <div class="block my-3 relative">
              <a href={item.link} class="rounded hover:border-gray-200 text-gray-800 hover:bg-gray-200 py-1 inline-flex items-center w-full tooltip">
                <%= Phoenix.HTML.raw(item.icon) %>
                <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 ml-14 rounded"><b><%= item.name %></b></span>
              </a>
            </div>
          <% end %>
        </div>

      </div>

    """
  end



  defp get_menu() do

    # <div onmouseover="showSubMenu({item.name})" onmouseout="hiddenSubMenu({item.name})">

    [
      %{
        parent: 1,
        has_sub_menu: false,
        name: "Inicio",
        link: "/home",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="home" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" class="h-8 w-8 ml-2 mr-auto">
            <g>
              <path fill="currentColor" d="M336 463.59V368a16 16 0 0 0-16-16h-64a16 16 0 0 0-16 16v95.71a16 16 0 0 1-15.92 16L112 480a16 16 0 0 1-16-16V300.06l184.39-151.85a12.19 12.19 0 0 1 15.3 0L480 300v164a16 16 0 0 1-16 16l-112-.31a16 16 0 0 1-16-16.1z" class="text-lime-600"></path>
              <path fill="currentColor" d="M573.32 268.35l-25.5 31a12 12 0 0 1-16.9 1.65L295.69 107.21a12.19 12.19 0 0 0-15.3 0L45.17 301a12 12 0 0 1-16.89-1.65l-25.5-31a12 12 0 0 1 1.61-16.89L257.49 43a48 48 0 0 1 61 0L408 116.61V44a12 12 0 0 1 12-12h56a12 12 0 0 1 12 12v138.51l83.6 68.91a12 12 0 0 1 1.72 16.93z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 2,
        has_sub_menu: false,
        name: "Catálogo",
        link: "/catalog",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="line-columns" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-8 w-8 ml-2 mr-auto">
            <g>
              <path fill="currentColor" d="M496 288H304a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0 128H304a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-256H304a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-128H304a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z" class="text-lime-600"></path>
              <path fill="currentColor" d="M208 288H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0 128H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-384H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zm0 128H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h192a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      }
    ]
  end

end
