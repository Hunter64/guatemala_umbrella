defmodule GuatemalaWeb.NotificationComponent do
  @moduledoc """
    Componente de mensaje de confirmación / exito
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    IO.puts("---------> ARRIVED HERE MOuNT Alert")
    {:ok, assign(
      socket,
      header: nil,
      description: nil,
      show: true,
      notification_type: nil
      )}
  end

  def update(attrs, socket) do
    attrs |> IO.inspect(label: " --------------------> attrs")
    IO.puts("---------> ARRIVED HERE UPDATE Alert")
    {:ok,
     assign(
       socket,
       header: Map.get(attrs, :header),
       description_alert: Map.get(attrs, :description_alert),
       show: Map.get(attrs, :show),
       notification_type: Map.get(attrs, :notification_type)
     )}
  end

  def render(assigns) do
    ~H"""
      <div>
      <%= if @show do %>
        <%= case @notification_type do %>

          <% "succesfully" -> %>

            <div id="succesfully_alert" class="inline-flex w-full z-10 fixed flex inset-0 zum place-items-center">
              <div class="relative h-auto w-96 mt-64 mb-64 py-64 ml-auto mr-auto">
                <div class="absolute top-20 right-0 h-auto w-full rounded border bg-white w-full inline-flex shadow-2xl">
                  <div class="inline-block">
                    <div class="w-full inline-flex bg-green-100">
                      <div class="w-1/12 ml-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-500" viewBox="0 0 20 20" fill="currentColor">
                          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                      </div>
                      <div class="w-11/12"><b><%= @header %></b></div>
                    </div>
                    <div class="w-full inline-flex text-sm">
                      <div class="w-1/12"></div>
                      <div class="w-11/12">
                        <%= @description_alert %>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          <% "error" -> %>

            <div id="error_alert" class="inline-flex w-full z-10 fixed flex inset-0 zum place-items-center">
              <div class="relative h-auto w-96 mt-64 mb-64 py-64 ml-auto mr-auto">
                <div class="absolute top-20 right-0 h-auto w-full rounded border bg-white w-full inline-flex shadow-2xl">
                  <div class="inline-block">
                    <div class="w-full inline-flex bg-red-100">
                      <div class="w-1/12 ml-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-red-500" viewBox="0 0 20 20" fill="currentColor">
                          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                        </svg>
                      </div>
                      <div class="w-11/12"><b><%= @header %></b></div>
                    </div>
                    <div class="w-full inline-flex text-sm">
                      <div class="w-1/12"></div>
                      <div class="w-11/12">
                        <%= @description_alert %>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <% "warning" -> %>

              <div id="warning_alert" class="inline-flex w-full z-10 fixed flex inset-0 zum place-items-center">
                <div class="relative h-auto w-96 mt-64 mb-64 py-64 ml-auto mr-auto">
                  <div class="absolute top-20 right-0 h-auto w-full rounded border bg-white w-full inline-flex shadow-2xl">
                    <div class="inline-block">
                      <div class="w-full inline-flex bg-yellow-100">
                        <div class="w-1/12 ml-2">

                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-5 h-5 text-yellow-500">
                          <path fill-rule="evenodd" d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12zM12 8.25a.75.75 0 01.75.75v3.75a.75.75 0 01-1.5 0V9a.75.75 0 01.75-.75zm0 8.25a.75.75 0 100-1.5.75.75 0 000 1.5z" clip-rule="evenodd" />
                        </svg>

                        </div>
                        <div class="w-11/12"><b><%= @header %></b></div>
                      </div>
                      <div class="w-full inline-flex text-sm">
                        <div class="w-1/12"></div>
                        <div class="w-11/12">
                          <%= @description_alert %>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

          <% end %>

      <% end %>
      </div>
    """
  end

  def set_timer_notificacion() do
    Task.async(fn ->
      :timer.sleep(5500)
      %{message: "close_notification"}
    end)
    :ok
  end

  def set_timer_notification_error() do
    Task.async(fn ->
      :timer.sleep(5500)
      %{message: "close_notification_error"}
    end)
    :ok
  end

  def set_timer_notification_warning() do
    Task.async(fn ->
      :timer.sleep(5500)
      %{message: "close_notification_warning"}
    end)
    :ok
  end

end
