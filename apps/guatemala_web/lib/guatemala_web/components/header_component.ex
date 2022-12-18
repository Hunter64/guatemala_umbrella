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
        parent: 5,
        has_sub_menu: false,
        name: "Productos",
        link: "/products",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="ballot-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M360 0H24A23.94 23.94 0 0 0 0 24v464a23.94 23.94 0 0 0 24 24h336a23.94 23.94 0 0 0 24-24V24a23.94 23.94 0 0 0-24-24zM161.7 202.4l12.6 12.7a5.37 5.37 0 0 1 0 7.6l-64.2 63.6a5.37 5.37 0 0 1-7.6 0L65.6 249a5.37 5.37 0 0 1 0-7.6l12.7-12.6a5.37 5.37 0 0 1 7.6 0l20.6 20.8 47.6-47.2a5.37 5.37 0 0 1 7.6 0zM64 112a16 16 0 0 1 16-16h32a16 16 0 0 1 16 16v32a16 16 0 0 1-16 16H80a16 16 0 0 1-16-16zm64 288a16 16 0 0 1-16 16H80a16 16 0 0 1-16-16v-32a16 16 0 0 1 16-16h32a16 16 0 0 1 16 16zm192-8a8 8 0 0 1-8 8H168a8 8 0 0 1-8-8v-16a8 8 0 0 1 8-8h144a8 8 0 0 1 8 8zm-9.6-120H170.2s29.2-30.2 30.4-32h109.7c5.3 0 9.6 3.6 9.6 8v16h.1c0 4.4-4.3 8-9.6 8zm9.6-136a8 8 0 0 1-8 8H168a8 8 0 0 1-8-8v-16a8 8 0 0 1 8-8h144a8 8 0 0 1 8 8z" class="text-lime-400"></path>
              <path fill="currentColor" d="M80 160h32a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16H80a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16zm94.3 55.1l-12.6-12.7a5.37 5.37 0 0 0-7.6 0l-47.6 47.2-20.6-20.8a5.37 5.37 0 0 0-7.6 0l-12.7 12.6a5.37 5.37 0 0 0 0 7.6l36.9 37.3a5.37 5.37 0 0 0 7.6 0l64.2-63.6a5.37 5.37 0 0 0 0-7.6zM112 352H80a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h32a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 2,
        has_sub_menu: false,
        name: "Clientes",
        link: "/customers",
        icon: """
        <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="users" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M96 224a64 64 0 1 0-64-64 64.06 64.06 0 0 0 64 64zm480 32h-64a63.81 63.81 0 0 0-45.1 18.6A146.27 146.27 0 0 1 542 384h66a32 32 0 0 0 32-32v-32a64.06 64.06 0 0 0-64-64zm-512 0a64.06 64.06 0 0 0-64 64v32a32 32 0 0 0 32 32h65.9a146.64 146.64 0 0 1 75.2-109.4A63.81 63.81 0 0 0 128 256zm480-32a64 64 0 1 0-64-64 64.06 64.06 0 0 0 64 64z" class="text-lime-400"></path>
              <path fill="currentColor" d="M396.8 288h-8.3a157.53 157.53 0 0 1-68.5 16c-24.6 0-47.6-6-68.5-16h-8.3A115.23 115.23 0 0 0 128 403.2V432a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48v-28.8A115.23 115.23 0 0 0 396.8 288zM320 256a112 112 0 1 0-112-112 111.94 111.94 0 0 0 112 112z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 3,
        has_sub_menu: false,
        name: "Tipos de Documentos",
        link: "/document_types",
        icon: """
        <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="cabinet-filing" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M0 480a32 32 0 0 0 32 32h448a32 32 0 0 0 32-32V256H0zm160-112a16 16 0 0 1 16-16h160a16 16 0 0 1 16 16v40a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24H192v24a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8zM480 0H32A32 32 0 0 0 0 32v192h512V32a32 32 0 0 0-32-32zM352 152a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24H192v24a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-40a16 16 0 0 1 16-16h160a16 16 0 0 1 16 16z" class="text-lime-400"></path>
              <path fill="currentColor" d="M336 96H176a16 16 0 0 0-16 16v40a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24h128v24a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-40a16 16 0 0 0-16-16zm0 256H176a16 16 0 0 0-16 16v40a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24h128v24a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-40a16 16 0 0 0-16-16z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      },
      %{
        parent: 4,
        has_sub_menu: false,
        name: "Tipos de Crédito",
        link: "/credit_types",
        icon: """
          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="file-invoice-dollar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="h-8 w-8 ml-2 mr-auto">
            <g class="fa-group">
              <path fill="currentColor" d="M384 128H272a16 16 0 0 1-16-16V0H24A23.94 23.94 0 0 0 0 23.88V488a23.94 23.94 0 0 0 23.88 24H360a23.94 23.94 0 0 0 24-23.88V128zM64 72a8 8 0 0 1 8-8h80a8 8 0 0 1 8 8v16a8 8 0 0 1-8 8H72a8 8 0 0 1-8-8zm0 80v-16a8 8 0 0 1 8-8h80a8 8 0 0 1 8 8v16a8 8 0 0 1-8 8H72a8 8 0 0 1-8-8zm144 263.88V440a8 8 0 0 1-8 8h-16a8 8 0 0 1-8-8v-24.29a57.32 57.32 0 0 1-31.37-11.35 8 8 0 0 1-.57-12.14L155.81 381a8.22 8.22 0 0 1 10.13-.73 24.06 24.06 0 0 0 12.82 3.73h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V232a8 8 0 0 1 8-8h16a8 8 0 0 1 8 8v24.29a57.17 57.17 0 0 1 31.37 11.35 8 8 0 0 1 .57 12.14L228.18 291a8.22 8.22 0 0 1-10.13.73 24 24 0 0 0-12.82-3.73h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19 44.44-42.67 45.07z" class="text-lime-400"></path>
              <path fill="currentColor" d="M377 105L279.1 7a24 24 0 0 0-17-7H256v112a16 16 0 0 0 16 16h112v-6.1a23.9 23.9 0 0 0-7-16.9zM219.09 327.42l-45-13.5c-5.16-1.54-8.77-6.78-8.77-12.73 0-7.27 5.3-13.19 11.8-13.19h28.11a24 24 0 0 1 12.82 3.73 8.22 8.22 0 0 0 10.13-.73l11.76-11.22a8 8 0 0 0-.57-12.14A57.17 57.17 0 0 0 208 256.29V232a8 8 0 0 0-8-8h-16a8 8 0 0 0-8 8v24.12c-23.62.63-42.67 20.55-42.67 45.07 0 20 13 37.81 31.58 43.39l45 13.5c5.16 1.54 8.77 6.78 8.77 12.73 0 7.27-5.3 13.19-11.8 13.19h-28.12a24.06 24.06 0 0 1-12.82-3.73 8.22 8.22 0 0 0-10.13.73l-11.75 11.22a8 8 0 0 0 .57 12.14A57.32 57.32 0 0 0 176 415.71V440a8 8 0 0 0 8 8h16a8 8 0 0 0 8-8v-24.12c23.67-.63 42.67-20.54 42.67-45.07 0-19.97-12.99-37.81-31.58-43.39z" class="text-lime-900"></path>
            </g>
          </svg>
        """
      }
    ]
  end

end
