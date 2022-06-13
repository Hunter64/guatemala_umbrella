defmodule Guatemala.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Guatemala.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Guatemala.PubSub}
      # Start a worker by calling: Guatemala.Worker.start_link(arg)
      # {Guatemala.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Guatemala.Supervisor)
  end
end
