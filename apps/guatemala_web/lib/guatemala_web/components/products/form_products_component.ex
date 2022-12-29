defmodule GuatemalaWeb.FormProductsComponent do
  @moduledoc """
  Form Search Products
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  # alias GuatemalaWeb.NotificationComponent, as: Notification
  # alias Guatemala.Products, as: Products

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, assign(socket,
      new: false,
      list: false,
      filters: %{}
    )}
  end

  def render(assigns) do
    ~H"""
      <div id="form_products" class="inline-flex w-full">

        <div class="h-hoch-93 w-96 mt-16 ml-16 block float-left bg-amber-100 dark:bg-slate-800">
          <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
            <p class="ml-2 font-bold text-lg text-white mt-1">Productos</p>
          </div>

          <div class="h-hoch-80 px-4 w-full relative mt-2">

            <div class="border-solid border-2 border-amber-700 px-2 py-1 rounded">
              <div>
                <label class="text-base font-bold text-amber-700 dark:text-white">Formulario de Búsqueda</label>
              </div>

              <form id="form_to_search_product" phx-submit="search_products" phx-target="#form_products">

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Clave:</label>
                  <input type="text" name="clave" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="clave" phx-target="#form_products" id="input_clave" placeholder="Clave de Producto" value="">
                </div>

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Nombre / Descripción:</label>
                  <input type="text" name="description" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="description" phx-target="#form_products" id="input_description" placeholder="Nombre / Descripción" value="">
                </div>

                <div class="py-2">
                  <button type="submit" form="form_to_search_product" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-slate-900 dark:text-white items-center inline-flex font-bold rounded text-sm w-full">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4 mr-2 ml-auto">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                    </svg>
                    <label class="cursor-pointer mr-auto text-slate-900 dark:text-white">Buscar</label>
                  </button>
                </div>

              </form>

            </div>

            <div class="py-2 px-2 mt-2">
              <button phx-click="new_product" phx-target="#form_products" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-auto">
                  <path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class="text-white"></path>
                </svg>
                <label class="cursor-pointer mr-auto text-white">Nuevo</label>
              </button>
            </div>
          </div>

        </div>

        <div class="w-full">
          <%!-- <%= if @new, do: live_component(GuatemalaWeb.FormNewProductsComponent, id: "new_product", new: true, list: false) %> --%>
          <%= if @list, do: live_component(GuatemalaWeb.ListProductsComponent, id: "list_products", new: false, list: true, filters: @filters) %>
        </div>

      </div>
    """
  end

  def handle_event("search_products", params, socket) do
    {:noreply, assign(
      socket,
      new: false,
      list: true,
      filters: params
      )}
  end

  def handle_event("new_product", _params, socket) do
    {:noreply, assign(
      socket,
      new: true,
      list: false
      )}
  end

end
