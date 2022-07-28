defmodule GuatemalaWeb.SuccesfullyComponent do
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
    IO.puts("---------> ARRIVED HERE UPDATE Alert")
    {:ok,
     assign(
       socket,
       header: Map.get(attrs, :header),
       description: Map.get(attrs, :description),
       show: Map.get(attrs, :show),
       notification_type: Map.get(attrs, :notification_type)
     )}
  end

  def render(assigns) do
    ~H"""
      <div>
      <%= if @show do %>
        <div id="succesfully_alert" class="inline-flex w-full">
          <div class="relative h-44 w-80">
            <div class="absolute top-20 right-0 h-16 w-full rounded border bg-white w-full inline-flex shadow-2xl">
              <div class="inline-block">
                <div class="w-full inline-flex">
                  <div class="w-2/12">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-500" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                  </div>
                  <div class="w-10/12"><b>Succesfully Saved!</b></div>
                </div>
                <div class="w-full inline-flex text-sm">
                  <div class="w-1/12"></div>
                  <div class="w-11/12">
                    Anyone with a link can now view this file.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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

end
