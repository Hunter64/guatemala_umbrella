defmodule GuatemalaWeb.ListProductsComponent do
  @moduledoc """
  Listing Products
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  # alias GuatemalaWeb.NotificationComponent, as: Notification
  alias Guatemala.Products, as: Products
  # alias Guatemala.GenericFunctions, as: Generic

  def mount(socket) do
    {:ok, socket}
  end

  def update(attrs, socket) do
    {:ok, assign(socket,
      new: false,
      show_details: false,
      list: true,
      product_id_show: 0,
      filters_to_return_from_edit: attrs.filters,
      all_products: Products.list_products() |> add_stock_for_test(),
      data_details: %{}
    )}

  end

  def render(assigns) do
    ~H"""

    <div id="list_products" class="bg-amber-100 dark:bg-slate-800 text-gray-600 h-screen mt-16 ml-1 w-full rounded float-left">

      <div class="w-full shadow-lg rounded-sm border border-gray-200">

        <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
          <p class="ml-2 font-bold text-lg text-white mt-1">Listado de Productos</p>
        </div>

        <div class="flex flex-col">
          <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-4 inline-block min-w-full sm:px-6 lg:px-8">
              <div class="overflow-hidden">
                <table class="min-w-full text-center">
                  <thead class="border-b bg-gray-800 dark:bg-gray-600">
                    <tr>
                      <th scope="col" class="text-sm font-medium text-white px-6 py-2">
                        Clave
                      </th>
                      <th scope="col" class="text-sm font-medium text-white px-6 py-2">
                        Descripción
                      </th>
                      <th scope="col" class="text-sm font-medium text-white px-6 py-2">
                        Stock
                      </th>
                      <th scope="col" class="text-sm font-medium text-white px-6 py-2">
                        Estatus
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <%= for item <- @all_products do %>
                      <%= if item.id == (@data_details |> Map.get(:id)) && @show_details do %>
                        <tr class="border-t-2 border-t-stone-700 dark:border-t-gray-100 border-l-2 border-l-stone-700 dark:border-l-gray-100 border-r-2 border-r-stone-700 dark:border-r-gray-100 bg-stone-300 dark:bg-gray-700 hover:bg-stone-300 hover:bg-gray-600 cursor-pointer" phx-click="show_details" phx-value-data={item.id} phx-target="#list_products">
                          <td class="px-6 py-2 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                            <div class="inline-flex w-full">
                              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-3 h-3 mr-5">
                                <path fill-rule="evenodd" d="M11.47 7.72a.75.75 0 011.06 0l7.5 7.5a.75.75 0 11-1.06 1.06L12 9.31l-6.97 6.97a.75.75 0 01-1.06-1.06l7.5-7.5z" clip-rule="evenodd" />
                              </svg>
                              <p><%= item.code %></p>
                            </div>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            <%= item.description %>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            <%= if item.stock_value >= 10 do %>
                              <div class="bg-green-300 dark:bg-green-500 border-solid border-2 border-green-400 rounded">
                                <%= item.stock_value %>
                              </div>
                            <% else %>
                              <%= if item.stock_value >= 5 && item.stock_value < 10 do %>
                                <div class="bg-yellow-300 dark:bg-yellow-500 border-solid border-2 border-yellow-400 rounded">
                                  <%= item.stock_value %>
                                </div>
                              <% else %>
                                <div class="bg-red-300 dark:bg-red-500 border-solid border-2 border-red-400 rounded px-5">
                                  <%= item.stock_value %>
                                </div>
                              <% end %>
                            <% end %>
                          </td>
                          <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap flex justify-center">
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
                        </tr>
                      <% else %>
                        <tr class="bg-stone-100 dark:bg-gray-500 border-b border-stone-300 hover:bg-stone-300 dark:hover:bg-gray-600 cursor-pointer" phx-click="show_details" phx-value-data={item.id} phx-target="#list_products">
                          <td class="px-6 py-2 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                            <div class="inline-flex w-full">
                              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-3 h-3 mr-5">
                                <path fill-rule="evenodd" d="M12.53 16.28a.75.75 0 01-1.06 0l-7.5-7.5a.75.75 0 011.06-1.06L12 14.69l6.97-6.97a.75.75 0 111.06 1.06l-7.5 7.5z" clip-rule="evenodd" />
                              </svg>
                              <p><%= item.code %></p>
                            </div>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            <%= item.description %>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            <%= if item.stock_value >= 10 do %>
                              <div class="bg-green-300 dark:bg-green-500 border-solid border-2 border-green-600 rounded">
                                <%= item.stock_value %>
                              </div>
                            <% else %>
                              <%= if item.stock_value >= 5 && item.stock_value < 10 do %>
                                <div class="bg-yellow-300 dark:bg-yellow-500 border-solid border-2 border-yellow-600 rounded">
                                  <%= item.stock_value %>
                                </div>
                              <% else %>
                                <div class="bg-red-300 dark:bg-red-500 border-solid border-2 border-red-600 rounded px-5">
                                  <%= item.stock_value %>
                                </div>
                              <% end %>
                            <% end %>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap flex justify-center">
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
                        </tr>
                      <% end %>

                      <%= if @show_details && item.id == (@data_details |> Map.get(:id)) do %>
                        <tr class="bg-stone-300 dark:bg-gray-700 border-l-2 border-l-stone-700 dark:border-l-gray-100 border-r-2 border-r-stone-700 dark:border-r-gray-100">
                          <td class="px-6 py-2 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                            Precio: $ <%= @data_details.price %>.00 MXN
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            Marca:
                              <b><%= @data_details.trademark %></b>
                            Proveedor:
                              <b><%= @data_details.provider %></b>
                            Tipo:
                              <b><%= @data_details.product_type %></b>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            XXX
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            YYY
                          </td>
                        </tr>
                        <tr class="bg-stone-300 dark:bg-gray-700 border-b-2 border-b-stone-700 dark:border-b-gray-100 border-l-2 border-l-stone-700 dark:border-l-gray-100 border-r-2 border-r-stone-700 dark:border-r-gray-100">
                          <td class="px-6 py-2 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-white">
                            Descuento: $ <%= @data_details.discount %>.00 MXN
                          </td>
                          <td colspan="2" class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap text-center">
                            Total: <b>$ <%= @data_details.real_price %>.00 MXN</b>
                          </td>
                          <td class="text-sm text-gray-900 dark:text-white font-light px-6 py-2 whitespace-nowrap">
                            ZZZ
                          </td>
                        </tr>
                      <% end %>

                    <% end %>
                  </tbody>
                </table>
                <p class="text-sm text-black dark:text-white">Total de Registros:  <b><%= @all_products |> Enum.count %></b></p>
              </div>
            </div>
          </div>
        </div>







      </div>

    </div>

    """
  end

  # Trabajando en alistar detalles, quitar separador entre renglones de la tabla de detalles

#   <%= if @show_details do %>
#   <div class="w-full bg-red-200">
#     <%= @data_details.description %>
#   </div>
# <% end %>

  def handle_event("show_details", params, socket) do
    details_previous_id = socket.assigns.data_details |> Map.get(:id) |> IO.inspect(label: "-------------- details_previous_id")

    {:noreply, assign(
      socket,
      # list: false,
      show_details: (if details_previous_id != (params["data"] |> String.to_integer), do: true, else: !socket.assigns.show_details) |> IO.inspect(label: "---------------------------SHOW DETaILS"),
      # product_id_show: params["product_id"]
      data_details: params["data"] |> Products.get_product!() |> add_other_details() |> IO.inspect(label: "------------------------------>>>>> DATA DETaILS")
      )}
      # |> IO.inspect(label: "-----------------<<<<<<<< ALL-")
  end

  def add_other_details(basic_data_product) do
    price = get_price_test()
    discount = get_discount_test()

    basic_data_product

      |> Map.put(:price, price)
      |> Map.put(:stock, :rand.uniform(20))
      |> Map.put(:discount, discount)
      |> Map.put(:real_price, (price - discount))
      |> Map.put(:provider, get_provider_test())
      |> Map.put(:trademark, get_trademark_test())
      |> Map.put(:product_type, get_product_type_test())
      |> IO.inspect(label: "---------------------------->>>>>>>>>>>> basic data product")

  end

  #START TEST FUNCTIONS
  def add_stock_for_test(list_products) do
    list_products
      |> Enum.map(fn x -> x |> Map.put(:stock_value, :rand.uniform(20)) end)
  end

  def get_price_test() do
    :rand.uniform(20000)
  end

  def get_discount_test() do
    [
      0,
      100,
      300
    ]
    |> Enum.at(:rand.uniform(3) - 1)
  end

  def get_provider_test do
    [
      "RADA",
      "ORCE",
      "MADERA",
      "LESTER"
    ]
    |> Enum.at(:rand.uniform(4) - 1)
  end

  def get_trademark_test do
    [
      "Oster",
      "Samsung",
      "Whirpool",
      "Mabe",
      "América",
      "Lester",
      "Winia",
      "Acros",
      "Iem",
      "Hisense",
      "Man",
      "Taurus"
    ]
    |> Enum.at(:rand.uniform(12) - 1)
  end

  def get_product_type_test() do
    [
      "Madera",
      "Colchones",
      "Electrodomésticos",
      "Línea Blanca",
      "Sábanas"
    ]
    |> Enum.at(:rand.uniform(5) - 1)
  end
  #END FUNCTIONS TEST

end
