defmodule GuatemalaWeb.FormDocumentTypesComponent do
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
    IO.puts(" --------------------------< ARRIVED HERE ")
    document_type = if attrs.edit, do: attrs.id |> get_document_type_by_id(), else: nil

    {:ok, assign(socket,
      new: attrs.new,
      edit: attrs.edit,
      document_type: document_type,
      form_valid: attrs.form_valid |> IO.inspect(label: " ------------------------> FORM VALID IN FORM "),
      form: attrs.form |> IO.inspect(label: " -----------------> FORM ")
    )}
  end

  def render(assigns) do
    ~H"""
      <div id="form_document_types" class="bg-amber-100 dark:bg-slate-800 mt-16 ml-1 w-96 h-hoch-93 rounded border float-left">

        <div class="inline-block bg-amber-700 dark:bg-slate-800 text-white px-6 py-4 w-full">
          <div class="inline-flex top-0 right-0 bg-amber-700 dark:bg-slate-800 text-white mt-2">
            <button phx-click="close" phx-target="#document_types" class="ml-80 -mt-4 text-white font-bold rounded shadow">
              <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-5 w-5 ml-auto">
                <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z" class=""></path>
              </svg>
            </button>
          </div>
          <label class="text-2xl font-normal text-white block"> <%= if @new, do: "Crear Tipo de Documento", else: "Editar Tipo de Documento" %></label>
        </div>

        <div class="h-hoch-80 px-8 w-full py-6 -mt-8 relative">
          <form id="form1" phx-submit={"submit_form"} phx-change={"update_form"} phx-target="#document_types">
            <input type="hidden" name="action" value={if @new, do: 1, else: 2}>
            <input type="hidden" name="id" value={if @edit, do: @document_type.id}>

            <div class="py-1 mt-2">
              <label class="block tracking-wide text-gray-700 font-bold">*Nombre</label>
              <input value={@form.name}
                type="text" style="text-transform: uppercase" name="name" maxlength="255" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-50 text-gray-700 border rounded py-2 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" placeholder="Introduce el Nombre" >
                <div class="-mt-2.5 text-red-700 text-xs font-medium"><%= @form_valid.name.message %></div>
            </div>

            <div class="py-1">
              <label class="block tracking-wide text-gray-700 font-bold">*Descripción</label>
              <input value={@form.description}
                type="text" style="text-transform: uppercase" name="description" maxlength="255" class="border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-50 text-gray-700 border rounded py-2 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" placeholder="Introduce la Descripción" >

                <div class="-mt-2.5 text-red-700 text-xs font-medium"><%= @form_valid.description.message %></div>

            </div>

              <button type="submit" form="form1" class="ml-5 py-2 w-32 bg-green-500 text-white hover:bg-green-400 items-center inline-flex font-bold rounded shadow focus:shadow-outline focus:outline-none rounded">
                <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="save" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-6">
                  <g class="fa-group">
                    <path fill="currentColor" d="M288 352a64 64 0 1 1-64-64 64 64 0 0 1 64 64z" class="text-white"></path>
                    <path fill="currentColor" d="M433.94 129.94l-83.88-83.88A48 48 0 0 0 316.12 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48V163.88a48 48 0 0 0-14.06-33.94zM224 416a64 64 0 1 1 64-64 64 64 0 0 1-64 64zm96-204a12 12 0 0 1-12 12H76a12 12 0 0 1-12-12V108a12 12 0 0 1 12-12h228.52a12 12 0 0 1 8.48 3.52l3.48 3.48a12 12 0 0 1 3.52 8.48z" class="text-white"></path>
                  </g>
                </svg>
                Guardar
              </button>

          </form>
        </div>



      </div>
    """
  end

  def get_document_type_by_id(id) do
    DocumentTypes.get_document_type!(id)
  end

end
