defmodule GuatemalaWeb.FormCustomersComponent do
  @moduledoc """
  Form Search Customers
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  # alias GuatemalaWeb.NotificationComponent, as: Notification
  # alias Guatemala.Customers, as: Customers

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
      <div id="form_customers" class="inline-flex w-full">

        <div class="h-hoch-93 w-96 mt-16 ml-16 block float-left bg-amber-100 dark:bg-slate-800">
          <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
            <p class="ml-2 font-bold text-lg text-white mt-1">Clientes</p>
          </div>

          <div class="h-hoch-80 px-4 w-full relative mt-2">

            <div class="border-solid border-2 border-amber-700 px-2 py-1 rounded">
              <div>
                <label class="text-base font-bold text-amber-700 dark:text-white">Formulario de Búsqueda</label>
              </div>

              <form id="form_to_search_customer" phx-submit="search_customers" phx-target="#form_customers">

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Clave:</label>
                  <input type="text" name="clave" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="clave" phx-target="#form_customers" id="input_clave" placeholder="Clave de Cliente" value="">
                </div>

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Nombre Largo:</label>
                  <input type="text" name="large_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="large_name" phx-target="#form_customers" id="input_large_name" placeholder="Nombre Largo" value="">
                </div>

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Razón Social:</label>
                  <input type="text" name="social_reason" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="social_reason" phx-target="#form_customers" id="input_social_reason" placeholder="Razón Social" value="">
                </div>

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white block">RFC:</label>
                  <input type="text" name="rfc" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="rfc" phx-target="#form_customers" id="input_rfc" placeholder="RFC" value="">
                </div>

                <div class="py-2">
                  <button type="submit" form="form_to_search_customer" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4 mr-2 ml-auto">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                    </svg>
                    <label class="cursor-pointer mr-auto text-white">Buscar</label>
                  </button>
                </div>

              </form>

            </div>

            <div class="py-2 px-2 mt-2">
              <button phx-click="new_customer" phx-target="#form_customers" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-auto">
                  <path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class="text-white"></path>
                </svg>
                <label class="cursor-pointer mr-auto text-white">Nuevo</label>
              </button>
            </div>
          </div>

        </div>

        <div class="w-full">
          <%= if @new, do: live_component(GuatemalaWeb.FormNewCustomersComponent, id: "new_customer", new: true, list: false) %>
          <%= if @list, do: live_component(GuatemalaWeb.ListCustomersComponent, id: "list_customers", new: false, list: true, filters: @filters) %>
        </div>

      </div>
    """
  end

  def handle_event("search_customers", params, socket) do
    {:noreply, assign(
      socket,
      new: false,
      list: true,
      filters: params
      )}
  end

  def handle_event("new_customer", _params, socket) do
    {:noreply, assign(
      socket,
      new: true,
      list: false
      )}
  end

end
