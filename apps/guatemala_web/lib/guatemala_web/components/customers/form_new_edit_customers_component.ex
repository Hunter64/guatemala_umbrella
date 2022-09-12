defmodule GuatemalaWeb.FormNewEditCustomersComponent do
  @moduledoc """
  Form Create New Customers
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    {:ok, socket}
  end

  def update(attrs, socket) do
    attrs |> IO.inspect(label: " --------> ATTRS NADA")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div id="form_new_edit_customer" class="bg-amber-100 dark:bg-slate-800 mt-16 ml-1 w-full rounded float-left">


          <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
            <p class="ml-2 font-bold text-lg text-white mt-1">Crear Cliente Nuevo</p>
          </div>

          <div class="h-hoch-80 px-4 w-full relative mt-2">

            <div class="border-solid border-2 border-amber-700 px-4 py-1 rounded">
              <div>
                <label class="text-base font-bold text-amber-700 dark:text-white">Rellene los campos necesarios</label>
              </div>

              <div class="w-full inline-block">

                <div class="w-full inline-flex">


                  <div class="w-15/100 py-2">
                    <label class="text-base font-normal text-amber-700 dark:text-white">Primer Nombre:</label>
                  </div>

                  <div class="w-30/100 py-2">
                    <input type="text" name="clave" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="clave" phx-target="#form_customers" id="input_clave" placeholder="Primer Nombre" value="">
                  </div>

                  <div class="w-10/100 py-2">
                  </div>

                  <div class="w-15/100 py-2">
                    <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Nombre:</label>
                  </div>

                  <div class="w-30/100 py-2">
                    <input type="text" name="large_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="large_name" phx-target="#form_customers" id="input_large_name" placeholder="Segundo Nombre" value="">
                  </div>
                </div>

                <div class="w-full inline-flex">
                  <div class="w-15/100 py-2">
                    <label class="text-base font-normal text-amber-700 dark:text-white">Primer Apellido:</label>
                  </div>

                  <div class="w-30/100 py-2">
                    <input type="text" name="clave" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="clave" phx-target="#form_customers" id="input_clave" placeholder="Primer Apellido" value="">
                  </div>

                  <div class="w-10/100 py-2">
                  </div>

                  <div class="w-15/100 py-2">
                    <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Apellido:</label>
                  </div>

                  <div class="w-30/100 py-2">
                    <input type="text" name="large_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="large_name" phx-target="#form_customers" id="input_large_name" placeholder="Segundo Apellido" value="">
                  </div>
                </div>

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
                <button phx-click="search_customers" phx-target="#form_customers" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4 mr-2 ml-auto">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                  </svg>
                  <label class="cursor-pointer mr-auto text-white">Buscar</label>
                </button>
              </div>

            </div>
          </div>


      </div>
    """
  end

end
