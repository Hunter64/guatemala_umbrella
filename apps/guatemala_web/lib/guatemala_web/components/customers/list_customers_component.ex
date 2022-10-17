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
    attrs |> IO.inspect(label: " -----------------> ATTRS - TO LIST IN The EDIT COMPONENT ------------------------------->>>>>>>>>>>>>>")
    # {:ok, socket}
    {:ok, assign(socket,
      new: false,
      edit: false,
      list: true,
      customer_id_edit: 0,
      all_customers: Customers.list_customers() |> IO.inspect(label: "----------------------------------------------->> ALL ")
        |> apply_all_filters(attrs.filters)
        |> add_email_and_phone()

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
                                <th class="p-2 whitespace-nowrap w-10/100">
                                    <div class="text-left">Clave</div>
                                </th>
                                <th class="p-2 whitespace-nowrap w-40/100">
                                    <div class="text-left">Nombre Corto</div>
                                </th>
                                <th class="p-2 whitespace-nowrap w-15/100">
                                    <div class="text-left">Teléfono</div>
                                </th>
                                <th class="p-2 whitespace-nowrap w-15/100">
                                    <div class="text-center">Email</div>
                                </th>
                                <th class="p-2 whitespace-nowrap w-10/100">
                                    <div class="text-center">Estatus</div>
                                </th>
                                <th class="p-2 whitespace-nowrap w-10/100">
                                    <div class="text-center">Editar</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="text-sm divide-y divide-gray-800 dark:divide-gray-100">

                          <%= for item <- @all_customers do %>

                            <tr class="bg-amber-100 dark:bg-slate-200 w-full">
                              <td class="p-2 whitespace-nowrap w-10/100">
                                  <div class="text-left"><%= item.id %></div>
                              </td>
                              <td class="p-2 whitespace-nowrap w-40/100">
                                  <div class="flex items-center">
                                      <div class="w-8 h-8 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full" src="https://www.svgrepo.com/show/362184/user-male.svg" width="30" height="30" srcset="https://www.svgrepo.com/show/362184/user-male.svg 4x" alt="Customer"></div>
                                      <div class="font-medium text-gray-800"><%= item.first_name <> " " <> item.first_surname %></div>
                                  </div>
                              </td>
                              <td class="p-2 whitespace-nowrap w-15/100">
                                  <div class="text-left"><%= item.phone %></div>
                              </td>
                              <td class="p-2 whitespace-nowrap w-15/100">
                                  <div class="text-left font-medium"><%= item.email %></div>
                              </td>
                              <td class="p-2 whitespace-nowrap w-10/100">
                                <%= if item.active do %>
                                  <div class="font-medium">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                                      <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12zm13.36-1.814a.75.75 0 10-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z" clip-rule="evenodd" class="text-green-500" />
                                    </svg>
                                  </div>
                                <% else %>
                                  <div class="font-medium">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                                      <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm-1.72 6.97a.75.75 0 10-1.06 1.06L10.94 12l-1.72 1.72a.75.75 0 101.06 1.06L12 13.06l1.72 1.72a.75.75 0 101.06-1.06L13.06 12l1.72-1.72a.75.75 0 10-1.06-1.06L12 10.94l-1.72-1.72z" clip-rule="evenodd" class="text-red-500" />
                                    </svg>
                                  </div>
                                <% end %>
                              </td>
                              <td class="p-2 whitespace-nowrap w-10/100">
                                  <div class="font-medium">
                                    <svg phx-click="edit_customer" phx-target="#list_customers" phx-value-customer_id={item.id} xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4 align-center cursor-pointer hover:bg-blue-200 hover:rounded">
                                      <path d="M18.75 12.75h1.5a.75.75 0 000-1.5h-1.5a.75.75 0 000 1.5zM12 6a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5A.75.75 0 0112 6zM12 18a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5A.75.75 0 0112 18zM3.75 6.75h1.5a.75.75 0 100-1.5h-1.5a.75.75 0 000 1.5zM5.25 18.75h-1.5a.75.75 0 010-1.5h1.5a.75.75 0 010 1.5zM3 12a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5A.75.75 0 013 12zM9 3.75a2.25 2.25 0 100 4.5 2.25 2.25 0 000-4.5zM12.75 12a2.25 2.25 0 114.5 0 2.25 2.25 0 01-4.5 0zM9 15.75a2.25 2.25 0 100 4.5 2.25 2.25 0 000-4.5z" />
                                    </svg>
                                  </div>
                              </td>

                          </tr>

                          <% end %>

                        </tbody>

                    </table>
                    <div class="w-full text-black dark:text-white mt-2">
                      Total de Registros:  <b><%= @all_customers |> Enum.count %></b>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-full">

          <%= if @edit, do: live_component(GuatemalaWeb.FormEditCustomersComponent, id: @customer_id_edit, new: false, edit: true, list: false) %>

        </div>

      </div>

    """
  end

  def add_email_and_phone(list_customers) do
    list_customers
      |> Enum.map(fn x ->
        x
          |> Map.put(:email, x.id |> get_email_data())
          |> Map.put(:phone, x.id |> get_phone_data())
        end)
  end

  def get_email_data(customer_id) do
    customer_id
      |> Guatemala.Emails.get_first_active_email_owner_id
      |> get_email()
  end

  def get_email(nil) do
    "Sin correo"
  end

  def get_email(email_data) do
    email_data
      |> Map.get(:email)
  end

  def get_phone_data(customer_id) do
    customer_id
      |> Guatemala.Phones.get_first_active_phone_owner_id()
      |> get_phone()
  end

  def get_phone(nil) do
    "Sin Teléfono"
  end

  def get_phone(phone_data) do
    "(" <> phone_data.lada_code <> ")" <> phone_data.number |> IO.inspect(label: " -------------------> NUMBER")
      # |> Map.get(:number)
  end

  def apply_all_filters(list_customers, params) do
    params["clave"]
      |> filter_clave(list_customers)
      |> filter_nombre_largo(params["large_name"])
  end

  def filter_clave(nil, list) do
    list
  end

  def filter_clave("", list) do
    list
  end

  def filter_clave(param, list) do
    list |> Enum.filter(fn x -> x.id == (param |> String.to_integer) end)
  end

  def filter_nombre_largo(list, nil) do
    list
  end

  def filter_nombre_largo(list, "") do
    list
  end

  def filter_nombre_largo(list, param) do
    list |> Enum.filter(fn x -> String.contains?(Guatemala.GenericFunctions.downcase(x.large_name), Guatemala.GenericFunctions.downcase(param)) end)
  end

  def handle_event("edit_customer", params, socket) do
    # params |> IO.inspect(label: " -------> HERE ")

    # params["customer_id"] |> Guatemala.Customers.get_customer!() |> IO.inspect(label: " -----------------> CUSTOMER")

    # {:noreply, socket}

    {:noreply, assign(
      socket,
      new: false,
      edit: true,
      customer_id_edit: params["customer_id"]
      )}

  end

end
