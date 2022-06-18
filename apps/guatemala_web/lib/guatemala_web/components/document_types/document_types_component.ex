defmodule GuatemalaWeb.DocumentTypeComponent do
  @moduledoc """
    Componente Document Types
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  alias Guatemala.DocumentTypes

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, assign(
      socket,
      new: false,
      edit: false,
      document_types: get_document_types()
      )
    }
  end

  def render(assigns) do
    ~H"""
      <div id="document_types" class="inline-flex w-full">

          <div class="h-hoch-93 w-80 mt-16 ml-16 block float-left bg-amber-100">
            <div class="w-full py-2 bg-amber-700">
              <p class="ml-2 font-bold text-lg text-white">Tipos de Documentos</p>
            </div>


            <div class="w-1/2 px-2 mt-2">
              <button phx-click="new_document_type" phx-target="#document_types" class="py-2 bg-green-500 hover:bg-green-400 text-white items-center inline-flex font-bold rounded text-sm w-full">
                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4 w-4 mr-2 ml-auto">
                  <path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" class="text-white"></path>
                </svg>
                <label class="cursor-pointer mr-auto text-white">Nuevo</label>
              </button>
            </div>

            <div class="h-hoch-70 overflow-y-scroll pb-16 mt-2">
              <%= for item <- @document_types do %>

                <div phx-click="open_edit_document_type" phx-value-id={item.id} phx-target="#document_types" class="border cursor-pointer border-blue-100 text-sm focus:outline-none focus:bg-white focus:border-blue-500 appearance-none block w-full bg-blue-300 text-gray-700 border rounded py-2 px-4 mb-3 leading-tight focus:outline-none focus:bg-white hover:bg-blue-300">

                  <div class="inline-flex w-full">
                    <div class="w-1/12">
                    </div>
                    <div class="w-9/12">
                      <h2 class="text-gray-700 text-base"><%= if String.length(item.name) > 15, do: String.slice(item.name, 0, 15) <> "... ", else: item.name %></h2>
                    </div>
                    <div class="w-2/12">

                      <%= if item.active == true do %>
                        <div class="ml-2 w-8 bg-green-200 text-xs font-bold rounded-full text-green-700">
                          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-4 w-4 ml-2 mr-auto">
                            <g class="fa-group">
                              <path fill="currentColor" d="M504.5 144.42L264.75 385.5 192 312.59l240.11-241a25.49 25.49 0 0 1 36.06-.14l.14.14L504.5 108a25.86 25.86 0 0 1 0 36.42z" class="text-green-500"></path>
                              <path fill="currentColor" d="M264.67 385.59l-54.57 54.87a25.5 25.5 0 0 1-36.06.14l-.14-.14L7.5 273.1a25.84 25.84 0 0 1 0-36.41l36.2-36.41a25.49 25.49 0 0 1 36-.17l.16.17z" class="text-green-900"></path>
                            </g>
                          </svg>
                        </div>
                      <% else %>
                        <div class="ml-2 w-8 bg-red-200 text-xs font-bold rounded-full text-red-700">
                          <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" class="h-4 w-4 ml-2 mr-auto">
                            <g class="fa-group">
                              <path fill="currentColor" d="M9.21,356.07a31.46,31.46,0,0,0,0,44.48l22.24,22.24a31.46,31.46,0,0,0,44.48,0L176,322.72,109.28,256ZM342.79,111.45,320.55,89.21a31.46,31.46,0,0,0-44.48,0L176,189.28,242.72,256,342.79,155.93a31.46,31.46,0,0,0,0-44.48Z" class="text-red-500"></path>
                              <path fill="currentColor" d="M342.79,356.07a31.46,31.46,0,0,1,0,44.48l-22.24,22.24a31.46,31.46,0,0,1-44.48,0L9.21,155.93a31.46,31.46,0,0,1,0-44.48L31.45,89.21a31.46,31.46,0,0,1,44.48,0Z" class="text-red-900"></path>
                            </g>
                          </svg>
                          </div>
                      <% end %>

                    </div>
                  </div>
                </div>
                <div class="m-4 mr-4 mt-0 mb-4 border-t-2 border-gray-300"></div>
              <% end %>
            </div>

            <div class="w-full mt-2 px-2">
              <label class="text-sm">Tipos de Documentos: <%= @document_types |> length %> </label>
            </div>
          </div>

          <div class="w-full">
            <%= @document_types |> Enum.count %>
            <%= if @new, do: live_component(GuatemalaWeb.FormDocumentTypesComponent, id: "document_type", new: true, edit: false) %>
            <%= if @edit, do: live_component(GuatemalaWeb.FormDocumentTypesComponent, id: @document_type_id, new: false, edit: true) %>
          </div>

      </div>

    """
  end

  def handle_event("new_document_type", _params, socket) do
    IO.puts("HERE ------------> NEW ")
    {:noreply, assign(
      socket,
      new: true,
      edit: false,
      document_type_id: 0,
      document_types: get_document_types()
      )}
  end

  def handle_event("open_edit_document_type", params, socket) do
    IO.puts("HERE ------------> EDIT ")
    {:noreply, assign(
      socket,
      new: false,
      edit: true,
      document_type_id: params["id"] |> String.to_integer
      )}
  end

  def get_document_types() do
    DocumentTypes.list_document_types
  end

end
