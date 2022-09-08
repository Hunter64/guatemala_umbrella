defmodule GuatemalaWeb.FormCustomersComponent do
  @moduledoc """
  Form Document Types
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  alias Guatemala.DocumentTypes

  def mount(socket) do
    {:ok, socket}
  end

  def update(attrs, socket) do
    attrs |> IO.inspect(label: " --------> ATTRS NADA")
    {:ok, socket}

    # {:ok, assign(socket,
    #   new: attrs.new,
    #   edit: attrs.edit,
    #   document_type: document_type,
    #   form_valid: attrs.form_valid |> IO.inspect(label: " ------------------------> FORM VALID IN FORM "),
    #   form: attrs.form |> IO.inspect(label: " -----------------> FORM ")
    # )}

    # <div class="inline-flex top-0 right-0 bg-amber-700 dark:bg-slate-800 text-white mt-2">
    #       </div>
  end

  def render(assigns) do
    ~H"""
      <div id="form_customers" class="bg-amber-100 dark:bg-slate-800 mt-16 ml-1 w-96 h-hoch-93 rounded border float-left ml-12 shadow">

        <div class="bg-amber-700 dark:bg-slate-800 text-white px-6 w-full mt-2">
          <label class="text-2xl font-normal text-white">Clientes</label>
        </div>

        <div class="h-hoch-80 px-6 w-full relative mt-2">

          <div class="border-solid border-2 border-amber-700 px-4 py-1 rounded">
            <div>
              <label class="text-base font-bold text-amber-700 dark:text-white">Formulario de Búsqueda</label>
            </div>

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
              <button phx-click="new_catalog" phx-target="#catalogs" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4 mr-2 ml-auto">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                </svg>
                <label class="cursor-pointer mr-auto text-white">Buscar</label>
              </button>
            </div>

          </div>

          <div class="py-2 px-4 mt-2">
            <button phx-click="new_catalog" phx-target="#catalogs" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
              <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-auto">
                <path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class="text-white"></path>
              </svg>
              <label class="cursor-pointer mr-auto text-white">Nuevo</label>
            </button>
          </div>

        </div>

      </div>
    """
  end

end
