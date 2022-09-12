defmodule GuatemalaWeb.ListCustomersComponent do
  @moduledoc """
  Listing Customers
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  # alias GuatemalaWeb.NotificationComponent, as: Notification
  alias Guatemala.Customers, as: Customers

  def mount(socket) do
    {:ok, socket}
  end

  def update(attrs, socket) do
    # {:ok, socket}
    {:ok, assign(socket,
      new: false,
      edit: false,
      list: true,
      all_customers: Customers.list_customers()
    )}

  end

  def render(assigns) do
    ~H"""

      <div id="list_customers" class="bg-amber-100 dark:bg-slate-800 text-gray-600 h-screen mt-16 ml-1 w-full rounded float-left">

        <div class="w-full shadow-lg rounded-sm border border-gray-200">

          <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
            <p class="ml-2 font-bold text-lg text-white mt-1">Listado de Clientes</p>
          </div>

            <div class="p-3">
                <div class="overflow-x-auto">
                    <table class="table-auto w-full">
                        <thead class="text-xs font-bold uppercase text-white bg-amber-700 dark:bg-slate-400">
                            <tr>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="text-left">Clave</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="text-left">Nombre Corto</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="text-left">Teléfono</div>
                                </th>
                                <th class="p-2 whitespace-nowrap">
                                    <div class="text-center">Email</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="text-sm divide-y divide-gray-800 dark:divide-gray-100">

                          <%= for item <- @all_customers do %>

                            <tr class="bg-amber-100 dark:bg-slate-200">
                              <td class="p-2 whitespace-nowrap">
                                  <div class="text-left"><%= item.id %></div>
                              </td>
                              <td class="p-2 whitespace-nowrap">
                                  <div class="flex items-center">

                                      <div class="w-8 h-8 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full" src="https://www.svgrepo.com/show/362184/user-male.svg" width="30" height="30" srcset="https://www.svgrepo.com/show/362184/user-male.svg 4x" alt="Customer"></div>
                                      <div class="font-medium text-gray-800"><%= item.first_name <> " " <> item.first_surname %></div>
                                  </div>
                              </td>
                              <td class="p-2 whitespace-nowrap">
                                  <div class="text-left">5578457845</div>
                              </td>
                              <td class="p-2 whitespace-nowrap">
                                  <div class="text-left font-medium">test@gmail.com</div>
                              </td>

                          </tr>

                          <% end %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

      </div>

    """
  end
end
