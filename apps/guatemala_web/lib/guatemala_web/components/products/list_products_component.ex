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

          <div class="p-3">
              <div class="overflow-x-auto">
                  <table class="table-auto w-full">
                      <thead class="text-xs font-bold uppercase text-white bg-amber-700 dark:bg-slate-400">
                          <tr>
                              <th class="p-2 whitespace-nowrap w-10/100">
                                  <div class="text-left">Clave</div>
                              </th>
                              <th class="p-2 whitespace-nowrap w-65/100">
                                  <div class="text-left">Descripción</div>
                              </th>
                              <th class="p-2 whitespace-nowrap w-15/100">
                                  <div class="text-left">Stock</div>
                              </th>
                              <th class="p-2 whitespace-nowrap w-10/100">
                                  <div class="text-center">Estatus</div>
                              </th>
                          </tr>
                      </thead>
                      <tbody class="text-sm ">
                        <%= for item <- @all_products do %>
                          <tr class="bg-amber-100 dark:bg-slate-200 hover:bg-stone-100 dark:hover:bg-stone-400 w-full cursor-pointer divide-y divide-gray-800 dark:divide-gray-100" phx-click="show_details" phx-value-data={item.id} phx-target="#list_products">
                            <td class="p-2 whitespace-nowrap w-10/100">
                              <div class="text-left"><%= item.code %></div>
                            </td>
                            <td class="p-2 whitespace-nowrap w-65/100">
                              <div class="text-left"><%= item.description %></div>
                            </td>
                            <td class="p-2 whitespace-nowrap w-15/100">
                              <%= if item.stock_value >= 10 do %>
                                <div class="text-left font-medium bg-green-300">
                                  <%= item.stock_value %>
                                </div>
                              <% else %>
                                <%= if item.stock_value >= 5 && item.stock_value < 10 do %>
                                  <div class="text-left font-medium bg-yellow-300">
                                    <%= item.stock_value %>
                                  </div>
                                <% else %>
                                  <div class="text-left font-medium bg-red-300">
                                    <%= item.stock_value %>
                                  </div>
                                <% end %>
                              <% end %>
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
                          </tr>

                          <%= if @show_details && item.id == (@data_details |> Map.get(:id)) do %>
                            <tr class="w-full bg-amber-200 dark:bg-slate-300 ">

                                <td class="p-2 whitespace-nowrap w-10/100">
                                  Precio: $ <%= @data_details.price %>.00 MXN
                                </td>
                                <td class="p-2 whitespace-nowrap w-65/100">
                                  Marca:
                                    <b><%= @data_details.trademark %></b>
                                  Proveedor:
                                    <b><%= @data_details.provider %></b>
                                  Tipo:
                                    <b><%= @data_details.product_type %></b>
                                </td>
                                <td class="p-2 whitespace-nowrap w-15/100">

                                </td>
                                <td class="p-2 whitespace-nowrap w-10/100">

                                </td>

                            </tr>
                            <tr class="w-full bg-amber-200 dark:bg-slate-300 ">

                                <td class="p-2 whitespace-nowrap w-10/100">
                                  Descuento: $ <%= @data_details.discount %>.00 MXN
                                </td>
                                <td class="p-2 whitespace-nowrap w-65/100">
                                  Total: <b>$ <%= @data_details.real_price %>.00 MXN</b>
                                </td>
                                <td class="p-2 whitespace-nowrap w-15/100">

                                </td>
                                <td class="p-2 whitespace-nowrap w-10/100">

                                </td>

                            </tr>
                          <% end %>

                        <% end %>
                      </tbody>
                  </table>

                  <div class="w-full text-black dark:text-white mt-2 tx-sm">
                    Total de Registros:  <b><%= @all_products |> Enum.count %></b>
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
