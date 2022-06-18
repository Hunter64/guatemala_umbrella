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
      document_type: document_type
    )}
  end

  def render(assigns) do
    ~H"""
      <div id="form_document_types" class="bg-white mt-16 ml-1 w-96 h-hoch-93 rounded border float-left">

        <div class="inline-block bg-blue-700 text-white px-6 py-4 w-full">
          <div class="inline-flex top-0 right-0 bg-blue-700 text-white mt-2">
            <button phx-click="close" phx-target="#document_types" class="ml-80 -mt-4 text-white font-bold rounded shadow">
              <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-5 w-5 ml-auto">
                <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z" class=""></path>
              </svg>
            </button>
          </div>
          <label class="text-2xl font-normal text-white block"> <%= if @new, do: "Crear Tipo de Documento", else: "Editar Tipo de Documento" %></label>
        </div>

      </div>
    """
  end

  def get_document_type_by_id(id) do
    DocumentTypes.get_document_type!(id)
  end

end
