defmodule GuatemalaWeb.FormEditCustomersComponent do
  @moduledoc """
  Form Create New Customers
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  alias Guatemala.GenericFunctions, as: Generic
  alias Guatemala.Customers, as: Customers
  alias Guatemala.EctoUtil, as: EctoUtil

  def mount(socket) do
    {:ok, socket}
  end

  def update(attrs, socket) do
    attrs |> IO.inspect(label: " --------> ATTRS EDIT--------------------------->")
    {:ok, assign(socket,
      customer: attrs.id |> get_customer_data(),
      add_new_email: false,
      add_new_phone: false
    )}
  end

  def render(assigns) do
    ~H"""
    <div id="form_edit_customer" class="bg-amber-100 dark:bg-slate-800 mt-16 ml-1 w-full rounded float-left">

      <div class="w-full py-2 bg-amber-700 dark:bg-slate-800">
        <p class="ml-2 font-bold text-lg text-white mt-1">Editar Cliente</p>
      </div>

      <div class="h-hoch-80 px-4 w-full relative mt-2">
        <form id="form_to_edit_customer" phx-submit="save_edit_customer" phx-target="#form_edit_customer">
          <div class="border-solid border-2 border-amber-700 px-4 py-1 rounded">
            <div>
              <label class="text-base font-bold text-amber-700 dark:text-white">Rellene los campos necesarios</label>
            </div>

            <div class="w-full inline-block">

              <div>
                <input type="hidden" name="customer_id" value={@customer.id}>
                <input type="hidden" name="email_active_id" value={@customer.email_active.id}>
                <input type="hidden" name="phone_active_id" value={@customer.phone_active.id}>
              </div>

              <div class="w-full inline-flex">
                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Primer Nombre:</label>
                </div>

                <div class="w-30/100 py-2">
                  <input type="text" name="first_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="first_name" phx-target="#form_customers" id="input_first_name" placeholder="Primer Nombre" value={@customer.first_name}>
                </div>

                <div class="w-10/100 py-2">
                </div>

                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Nombre:</label>
                </div>

                <div class="w-30/100 py-2">
                  <input type="text" name="second_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="second_name" phx-target="#form_customers" id="input_second_name" placeholder="Segundo Nombre" value={@customer.second_name}>
                </div>
              </div>

              <div class="w-full inline-flex">
                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Primer Apellido:</label>
                </div>

                <div class="w-30/100 py-2">
                  <input type="text" name="first_surname" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="first_surname" phx-target="#form_customers" id="input_first_surname" placeholder="Primer Apellido" value={@customer.first_surname}>
                </div>

                <div class="w-10/100 py-2">
                </div>

                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Apellido:</label>
                </div>

                <div class="w-30/100 py-2">
                  <input type="text" name="second_surname" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="second_surname" phx-target="#form_customers" id="input_second_surname" placeholder="Segundo Apellido" value={@customer.second_surname}>
                </div>
              </div>

              <div class="w-full inline-flex">
                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Teléfono:</label>
                </div>

                <div class="w-27/100 py-2">
                  <select phx-hook="select_phone_for_customer" id="phones_list" name="phone_selected" class="w-full py-1 rounded">
                    <%= for item <- @customer.phones do %>

                      <%= if item.id == @customer.phone_active.id do %>
                        <option value={ item.id } selected >
                         <%= item.number %>
                        </option>
                        <% else %>
                        <option value={ item.id } >
                         <%= item.number %>
                        </option>
                      <% end %>

                    <% end %>
                  </select>
                </div>

                <div class="w-3/100 py-2 px-2 tooltip" phx-click="edit_phones" phx-target="#form_edit_customer">
                  <%= if @add_new_phone do %>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                      <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm3 10.5a.75.75 0 000-1.5H9a.75.75 0 000 1.5h6z" clip-rule="evenodd" class="text-green-500 cursor-pointer"/>
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Ocultar</span>
                  <% else %>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                      <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zM12.75 9a.75.75 0 00-1.5 0v2.25H9a.75.75 0 000 1.5h2.25V15a.75.75 0 001.5 0v-2.25H15a.75.75 0 000-1.5h-2.25V9z" clip-rule="evenodd" class="text-green-500 cursor-pointer"/>
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Agregar Nuevo</span>
                  <% end %>
                </div>

                <div class="w-10/100 py-2">
                </div>

                <div class="w-15/100 py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white">Email:</label>
                </div>

                <div class="w-27/100 py-2">
                  <select phx-hook="select_email_for_customer" id="emails_list" name="email_selected" class="w-full py-1 rounded">
                    <%= for item <- @customer.emails do %>

                      <%= if item.id == @customer.email_active.id do %>
                        <option value={ item.id } selected >
                         <%= item.email %>
                        </option>
                        <% else %>
                        <option value={ item.id } >
                         <%= item.email %>
                        </option>
                      <% end %>

                    <% end %>
                  </select>
                </div>

                <div class="w-3/100 py-2 px-2 tooltip" phx-click="edit_emails" phx-target="#form_edit_customer">
                  <%= if @add_new_email do %>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                      <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm3 10.5a.75.75 0 000-1.5H9a.75.75 0 000 1.5h6z" clip-rule="evenodd" class="text-green-500 cursor-pointer"/>
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Ocultar</span>
                  <% else %>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4">
                      <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zM12.75 9a.75.75 0 00-1.5 0v2.25H9a.75.75 0 000 1.5h2.25V15a.75.75 0 001.5 0v-2.25H15a.75.75 0 000-1.5h-2.25V9z" clip-rule="evenodd" class="text-green-500 cursor-pointer"/>
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Agregar Nuevo</span>
                  <% end %>
                </div>
              </div>

              <div class="w-full inline-flex">
                <div class="w-45/100 py-2">
                  <%= if @add_new_phone do %>
                    <input type="text" name="new_phone" maxlength="128" class="cursor-pointer shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="new_phone" id="input_new_phone" placeholder="Agregar Nuevo Teléfono" value="">
                  <% end %>
                </div>

                <div class="w-10/100 py-2">
                </div>

                <div class="w-45/100 py-2">
                  <%= if @add_new_email do %>
                    <input type="text" name="new_email" maxlength="128" class="cursor-pointer shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="new_email" id="input_new_email" placeholder="Agregar Nuevo Email" value="">
                  <% end %>
                </div>
              </div>

            </div>

            <div class="py-2">
              <label class="text-base font-normal text-amber-700 dark:text-white block">Comentarios:</label>
              <input type="text" name="comments" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="comments" id="input_comments" placeholder="Comentarios" value={@customer.comments}>
            </div>

            <div class="py-2 w-full inline-flex">
              <div class="w-75/100 py-2"></div>
              <div class="w-25/100 py-2">
                <button type="submit" form="form_to_edit_customer" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="h-4 w-4 mr-2 ml-auto">
                    <path d="M3.375 3C2.339 3 1.5 3.84 1.5 4.875v.75c0 1.036.84 1.875 1.875 1.875h17.25c1.035 0 1.875-.84 1.875-1.875v-.75C22.5 3.839 21.66 3 20.625 3H3.375z" />
                    <path fill-rule="evenodd" d="M3.087 9l.54 9.176A3 3 0 006.62 21h10.757a3 3 0 002.995-2.824L20.913 9H3.087zM12 10.5a.75.75 0 01.75.75v4.94l1.72-1.72a.75.75 0 111.06 1.06l-3 3a.75.75 0 01-1.06 0l-3-3a.75.75 0 111.06-1.06l1.72 1.72v-4.94a.75.75 0 01.75-.75z" clip-rule="evenodd" />
                  </svg>
                  <label class="cursor-pointer mr-auto text-white">Guardar</label>
                </button>
              </div>
            </div>

          </div>
        </form>
      </div>

    </div>
    """
  end

  def handle_event("edit_phones", _params, socket) do
    {:noreply, assign(
      socket,
      add_new_phone: !socket.assigns.add_new_phone
    )}
  end

  def handle_event("edit_emails", params, socket) do
    params |> IO.inspect(label: " -------> Edit emails ")
    socket.assigns.add_new_email |> IO.inspect(label: " -----------> socket.assigns.add_new_email")
    # params["customer_id"] |> Guatemala.Customers.get_customer!() |> IO.inspect(label: " -----------------> CUSTOMER")

    # {:noreply, socket}

    {:noreply, assign(
      socket,
      add_new_email: !socket.assigns.add_new_email
    )}

    # {:noreply, assign(
    #   socket,
    #   new: false,
    #   edit: true,
    #   customer_id_edit: params["customer_id"]
    #   )}

  end

  def handle_event("save_edit_customer", params, socket) do
    params |> IO.inspect(label: " ----------------> PARAMS EDIT CUSTOMER")
    params["new_email"] |> create_new_email(params)
    params["new_phone"] |> create_new_phone(params)
    # params["email_active_id"] |> Guatemala.Emails.get_email!() |> Guatemala.Emails.update_email(%{active: false}) |> IO.inspect(label: " -----------> EDIT PREVIOUS EMAIL")
    {:noreply, socket}
  end

  def get_customer_data(customer_id) do
    customer_id
      |> Customers.get_customer!()
      |> get_other_data()
  end

  def get_other_data(customer) do
    phone_data =
      customer.id
        |> Guatemala.Phones.get_list_phones_owner_id()
        |> IO.inspect(label: " ----------> PHONE")

    email_data =
      customer.id
        |> Guatemala.Emails.get_list_emails_owner_id()
        |> IO.inspect(label: "------> EMIL ")

    customer
      |> Map.put(:phones, phone_data)
      |> Map.put(:emails, email_data)
      |> Map.put(:email_active, customer.id |> Guatemala.Emails.get_first_active_email_owner_id())
      |> Map.put(:phone_active, customer.id |> Guatemala.Phones.get_first_active_phone_owner_id())
      |> IO.inspect(label: " --------------------> ALL CUSTOMERS ")
  end

  def create_new_email("", _params) do
    IO.puts("NOTHING EMAIL")
  end

  def create_new_email(new_email, params) do
    %{
      active: true,
      catalog_id: 1,
      creator_user_id: 1,
      email: new_email,
      owner_id: params["customer_id"]
    }
    |> Guatemala.Emails.create_email()
    |> case do
      {:ok, email}
        ->
          email |> IO.inspect(label: " --------------------> NEW EMAIL FOR CUSTOMER")
          params["email_active_id"] |> Guatemala.Emails.get_email!() |> Guatemala.Emails.update_email(%{active: false}) |> IO.inspect(label: " -----------> EDIT PREVIOUS EMAIL")
      {:error, %Ecto.Changeset{} = changeset}
        ->
          "Error" <> EctoUtil.get_errors(changeset) |> IO.inspect(label: " ------------------> ERROR")
    end
  end

  def create_new_phone("", _params) do
    IO.puts("NOTHING PHONE")
  end

  def create_new_phone(new_phone, params) do
    %{
      active: true,
      catalog_id: 1,
      country_code: "+52",
      creator_user_id: 1,
      extension: "",
      lada_code: "55",
      number: new_phone,
      owner_id: params["customer_id"]
    }
    |> Guatemala.Phones.create_phone()
    |> case do
      {:ok, phone}
        ->
          phone |> IO.inspect(label: " --------------------> NEW Phone FOR CUSTOMER")
          params["phone_active_id"] |> Guatemala.Phones.get_phone!() |> Guatemala.Phones.update_phone(%{active: false}) |> IO.inspect(label: " -----------> EDIT PREVIOUS Phone")
      {:error, %Ecto.Changeset{} = changeset}
        ->
          "Error" <> EctoUtil.get_errors(changeset) |> IO.inspect(label: " ------------------> ERROR")
    end
  end

end
