defmodule GuatemalaWeb.DocumentTypeComponent do
  @moduledoc """
    Componente Document Types
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  alias Guatemala.DocumentTypes, as: DocumentTypes
  alias Guatemala.GenericFunctions, as: Generic
  alias Guatemala.EctoUtil, as: EctoUtil

  @new_action 1
  @edit_action 2

  def mount(socket) do
    {:ok, socket}
  end

  def update(_attrs, socket) do
    {:ok, assign(
      socket,
      new: false,
      edit: false,
      document_types: get_document_types(),
      form_valid: init_fill_form(),
      form: fill_form()
      )
    }
  end

  def render(assigns) do
    ~H"""
      <div id="document_types" class="inline-flex w-full">

          <div class="h-hoch-93 w-80 mt-16 ml-16 block float-left bg-amber-100 dark:bg-slate-800">
            <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
              <p class="ml-2 font-bold text-lg text-white">Tipos de Documentos</p>
            </div>


            <div class="w-1/2 px-2 mt-2">
              <button phx-click="new_document_type" phx-target="#document_types" class="py-2 bg-green-500 dark:bg-slate-800 hover:bg-green-400 text-white items-center inline-flex font-bold rounded text-sm w-full">
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
              <label class="text-sm text-black dark:text-white">Tipos de Documentos: <%= @document_types |> length %> </label>
            </div>
          </div>

          <div class="w-full">
            <%= @document_types |> Enum.count %>
            <%= if @new, do: live_component(GuatemalaWeb.FormDocumentTypesComponent, id: "document_type", new: true, edit: false, form_valid: @form_valid, form: @form) %>
            <%= if @edit, do: live_component(GuatemalaWeb.FormDocumentTypesComponent, id: @document_type_id, new: false, edit: true, form_valid: @form_valid, form: @form) %>
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
      form: params["id"] |> String.to_integer |> get_document_type_by_id() |> IO.inspect(label: " ---------------> FORM "),
      form_valid?: init_fill_form(),
      document_type_id: params["id"] |> String.to_integer
      )}
  end

  def handle_event("submit_form", params, socket) do
    action = params["action"] |> String.to_integer
    values = params

    action |> IO.inspect(label: " -------------> ACTION")
    values |> IO.inspect(label: " ------------> VALUES ")

    valid =
      params
      |> Map.to_list()
      |> validate_all_form(socket.assigns.form_valid)

    valid
    |> Map.to_list()
    |> Generic.validate_all_form(true)
    |> case do
      false ->
        {:noreply, assign(
          socket,
          form_valid: valid
        )}
      true ->
        run_action(action, (if action == @new_action, do: socket.assigns.form, else: values), socket)
    end
  end

  def handle_event("update_form", params, socket) do
    target = params["_target"] |> List.first()
    update = params
      |> Map.get(target)

    form_valid =
      socket.assigns.form_valid
      |> Generic.validate_form(target, update)

    {:noreply, assign(
      socket,
      form: socket.assigns.form |> update_form(target, update),
      form_valid: form_valid
     )}
  end

  def get_document_type_by_id(id) do
    DocumentTypes.get_document_type!(id)
  end

  def run_action(@new_action, params, socket) do
    document_type_pre = %{
      active: true,
      creator_user_id: 1,
      description: params |> Map.get(:description) |> String.trim() |>Generic.titelize_sentence,
      name: params |> Map.get(:name) |> String.trim() |> Generic.titelize_sentence
    }
    validate_duplicated(document_type_pre, socket)
      |> case do
        true ->
          DocumentTypes.create_document_type(document_type_pre)
            |> case do
              {:ok, document_type}
                ->
                  "Tipo de Documento creado correctamente." |> IO.inspect(label: " ------> MENSAJE OK")
                  document_type |> IO.inspect(label: " ---> Objeto Creado")
              {:error, %Ecto.Changeset{} = changeset}
                ->
                  "Error -> " <> EctoUtil.get_errors(changeset)
                    |> IO.inspect(label: " -----> MENSAJE ERROR")
            end
        false ->
          "Registro Existente"
            |> IO.inspect(label: " --------->")
      end
  end

  def run_action(@edit_action, params, socket) do
    document_type = params["id"] |> String.to_integer |> get_document_type_by_id()
    document_type_pre =
      %{
        active: params["active"] == "on",
        description: params["description"] |> String.trim() |> Generic.titelize_sentence,
        modifier_user_id: 1,#socket.assigns.session.user_id |> String.to_integer,
        name: params["name"] |> String.trim() |> Generic.titelize_sentence
      }
      validate_duplicated(document_type_pre, socket, document_type.id)
      |> case do
        true ->
          DocumentTypes.update_document_type(document_type, document_type_pre)
            |> case do
              {:ok, document_type}
                #-> update_socket_result(socket, "Instalador <b>" <> document_type.name <> "</b> editado correctamente", @success_message, @edit, document_type)
                -> "Exito en el objetivo"
                  |> IO.inspect(label: " -----> MENSAJE OK")
              {:error, %Ecto.Changeset{} = changeset}
                -> "Error al intentar modificar"
                  |> IO.inspect(label: " -----> MENSAJE ERROR")
                #-> update_socket_result(socket, "Error al intentar actualizar el Instalador " <> EctoUtil.get_errors(changeset), @error_message, @edit, document_type)
            end
        false ->
          # update_socket_result(socket, "El registro ya existe", @error_message, @edit, document_type)
          "El registro ya existe"
          |> IO.inspect(label: " ----------------> ERROR")
      end
  end

  def validate_duplicated(document_type_pre, socket) do
    socket.assigns.document_types
      |> Enum.map(fn x -> x.name |> String.downcase() end)
      |> compare_names(document_type_pre.name |> String.downcase)
  end
  def validate_duplicated(document_type_pre, socket, document_type_id) do
    socket.assigns.document_types
      |> Enum.reject(fn document_type -> document_type.id == document_type_id end)
      |> Enum.map(fn x -> x.name |> String.downcase() end)
      |> compare_names(document_type_pre.name |> String.downcase)
  end

  defp compare_names(names, name) do
    name
      |> String.downcase()
      |> exist_string_in_list?(names)
      |> Kernel.!
  end

  defp exist_string_in_list?(string, list), do: string in list

  defp update_form(form, target, update, _aux \\ "") do
    form
      |> Map.put(target |> String.to_atom(), update)
  end

  defp fill_form() do
    Map.new
    |> Map.put(:name, "")
    |> Map.put(:description, "")
  end

  defp init_fill_form() do
    %{}
    |> Map.put(:id, %{
      valid: true,
      required: [],
      message: ""
    })
    |> Map.put(:action, %{
      valid: true,
      required: [],
      message: ""
    })
    |> Map.put(:active, %{
      valid: true,
      required: [],
      message: ""
    })
    |> Map.put(:description, %{
        valid: true,
        required: [
          %{func: &Generic.required/1, message: "El valor es requerido"}
        ],
        message: ""
      })
      |> Map.put(:name, %{
        valid: true,
        required: [
          %{func: &Generic.required/1, message: "El valor es requerido"}
        ],
        message: ""
      })
  end

  defp validate_all_form([{target, value} | others], validators) do
    validators =
      validators
      |> Generic.validate_form(target, value)

    validate_all_form(others, validators)
  end

  defp validate_all_form([], validators), do: validators

  def get_document_types() do
    DocumentTypes.list_document_types
  end

end
