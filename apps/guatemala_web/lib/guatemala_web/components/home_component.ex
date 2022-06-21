defmodule GuatemalaWeb.HomeComponent do
  @moduledoc """
  Componente Home
  """
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def mount(socket) do
    dark = get_dark();
    {:ok, assign(socket,
      dark: dark
    )}
  end

  def render(assigns) do
    ~H"""
      <html lang="en" class={@dark}>
        <div id="homito">

          <div class="inline-flex mt-20 w-full">
            <div class="w-95/100"></div>
            <div class="w-5/100">
              <button>
                <%= if @dark == "dark" do %>
                  <div class="tooltip" phx-click="change_mode" phx-value-mode="false" phx-target="#homito">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                      <path class="text-lime-400" fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd" />
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Modo Claro</span>
                  </div>
                <% else %>
                  <div class="tooltip" phx-click="change_mode" phx-value-mode="true" phx-target="#homito">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                      <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
                    </svg>
                    <span class="text-xs absolute tooltip-text text-white bg-lime-500 dark:bg-slate-800 rounded">Modo Nocturno</span>
                  </div>
                <% end %>
              </button>
            </div>
          </div>

          <div class="flex justify-center ml-60 mt-48">
            <img src="/images/logo-guatemala.png" />
          </div>

        </div>
      </html>
    """
  end

  def handle_event("change_mode", params, socket) do
    value = params["mode"] |> string_to_bool()
    Guatemala.DocumentTypes.update_document_type(Guatemala.DocumentTypes.get_document_type!(1), %{active: value})

    #   # send_update(GuatemalaWeb.HeaderComponent, id: "header", session: %{}, dark: dark) --> NEW SEND UPDATE WAY
    redirect_to("/home")

    {:noreply, assign(
      socket,
      dark: get_dark()
    )}

  end

  defp string_to_bool("true"), do: true
  defp string_to_bool(_), do: false

  defp redirect_to(url) do
    Task.async(fn ->
      %{url: url}
    end)
  end

  def get_dark() do
    Guatemala.DocumentTypes.get_document_type!(1)
      |> Map.get(:active)
      |> case do
        true ->
          "dark"
        false ->
          ""
      end
  end

end
