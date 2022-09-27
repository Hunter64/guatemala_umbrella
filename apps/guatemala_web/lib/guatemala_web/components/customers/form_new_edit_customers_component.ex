defmodule GuatemalaWeb.FormNewEditCustomersComponent do
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

            <form id="form_customer" phx-submit="save_customer" phx-target="#form_new_edit_customer">
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
                      <input type="text" name="first_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="first_name" phx-target="#form_customers" id="input_first_name" placeholder="Primer Nombre" value="">
                    </div>

                    <div class="w-10/100 py-2">
                    </div>

                    <div class="w-15/100 py-2">
                      <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Nombre:</label>
                    </div>

                    <div class="w-30/100 py-2">
                      <input type="text" name="second_name" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="second_name" phx-target="#form_customers" id="input_second_name" placeholder="Segundo Nombre" value="">
                    </div>
                  </div>

                  <div class="w-full inline-flex">
                    <div class="w-15/100 py-2">
                      <label class="text-base font-normal text-amber-700 dark:text-white">Primer Apellido:</label>
                    </div>

                    <div class="w-30/100 py-2">
                      <input type="text" name="first_surname" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="first_surname" phx-target="#form_customers" id="input_first_surname" placeholder="Primer Apellido" value="">
                    </div>

                    <div class="w-10/100 py-2">
                    </div>

                    <div class="w-15/100 py-2">
                      <label class="text-base font-normal text-amber-700 dark:text-white">Segundo Apellido:</label>
                    </div>

                    <div class="w-30/100 py-2">
                      <input type="text" name="second_surname" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="second_surname" phx-target="#form_customers" id="input_second_surname" placeholder="Segundo Apellido" value="">
                    </div>
                  </div>

                  <div class="w-full inline-flex">
                    <div class="w-15/100 py-2">
                      <label class="text-base font-normal text-amber-700 dark:text-white">Teléfono:</label>
                    </div>

                    <div class="w-30/100 py-2">
                      <input type="text" name="phone" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="phone" phx-target="#form_customers" id="input_phone" placeholder="Teléfono" value="">
                    </div>

                    <div class="w-10/100 py-2">
                    </div>

                    <div class="w-15/100 py-2">
                      <label class="text-base font-normal text-amber-700 dark:text-white">Email:</label>
                    </div>

                    <div class="w-30/100 py-2">
                      <input type="text" name="email" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="email" phx-target="#form_customers" id="input_email" placeholder="Email" value="">
                    </div>
                  </div>

                </div>

                <div class="py-2">
                  <label class="text-base font-normal text-amber-700 dark:text-white block">Comentarios:</label>
                  <input type="text" name="comments" maxlength="128" class="shadow w-full px-2 py-1 border-amber-100 focus:border-amber-500 text-sm appearance-none block text-gray-700 border rounded leading-tight focus:outline-none focus:bg-white" phx-value-name="comments" phx-target="#form_customers" id="input_comments" placeholder="Comentarios" value="">
                </div>

                <div class="w-full inline-flex">
                  <div class="w-75/100 py-2"></div>
                  <div class="w-25/100 py-2">
                    <button type="submit" form="form_customer" class="shadow py-2 bg-green-500 dark:bg-green-400 hover:bg-green-400 dark:hover:bg-green-300 text-white items-center inline-flex font-bold rounded text-sm w-full">
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

  def handle_event("save_customer", params, socket) do
    params |> IO.inspect(label: " ---------------------> OPARAMS ")
    customer_pre =%{
      active: true,
      catalog_id: 1,
      comments: params["comments"] |> validate_possible_nil(false),
      creator_user_id: 1,
      credit_type_id: 1,
      first_name: params["first_name"] |> String.trim() |> Generic.titelize_sentence,
      first_surname: params["first_surname"] |> String.trim() |> Generic.titelize_sentence,
      large_name: params |> get_large_name(),
      moral_person: false,
      rfc: "XAXX010101000",
      second_name: params["second_name"] |> String.trim() |> Generic.titelize_sentence,
      second_surname: params["second_surname"] |> String.trim() |> Generic.titelize_sentence,
      social_reason: "XXX",
      email: params["email"],
      phone: params["phone"]
    }

    customer_pre
      |> IO.inspect(label: " -------------> CUSOTMER PER")
      |> Customers.create_customer()
      |> case do
        {:ok, customer}
          ->
            create_email(customer_pre.email, customer.id)
            create_phone(customer_pre.phone, customer.id)
        {:error, %Ecto.Changeset{} = changeset}
          ->
            "Error" <> EctoUtil.get_errors(changeset)
      end


    {:noreply, assign(
      socket,
      x: "adsf"
      )
    }
  end

  def create_email("", _customer_id) do
    nil
  end

  def create_email(email, customer_id) do
    %{
      active: true,
      catalog_id: 1,
      creator_user_id: 1,
      email: email,
      owner_id: customer_id
    }
    |> Guatemala.Emails.create_email()
    |> IO.inspect(label: " --------------> CREATE EMAIL")
  end

  def create_phone("", _customer_id) do
    nil
  end

  def create_phone(phone, customer_id) do
    %{
      active: true,
      catalog_id: 1,
      country_code: "52",
      creator_user_id: 1,
      extension: "00",
      lada_code: "55",
      number: phone,
      owner_id: customer_id
    }
    |> Guatemala.Phones.create_phone()
    |> IO.inspect(label: " -----------------> CREATE PHONE")
  end

  def get_large_name(params) do
    (params["first_name"] |> String.trim() |> Generic.titelize_sentence)
    <> " " <>
    (params["second_name"] |> validate_possible_nil(true))
    <>
    (params["first_surname"] |> String.trim() |> Generic.titelize_sentence)
    <> " " <>
    (params["second_surname"] |> validate_possible_nil(false))
  end

  def validate_possible_nil(data, last_space) do
    data
      |> Generic.valid_string_data()
      |> case do
        true ->
          (data |> String.trim() |> Generic.titelize_sentence) <> (if last_space, do: " ", else: "")
        false ->
          ""
      end
  end

end
