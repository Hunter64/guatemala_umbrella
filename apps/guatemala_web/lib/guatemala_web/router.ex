defmodule GuatemalaWeb.Router do
  use GuatemalaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GuatemalaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    #plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GuatemalaWeb do
    pipe_through :browser

    # get "/", PageController, :index
    get "/", HomeController, :index
    get "/home", HomeController, :index
    get "/document_types", DocumentTypeController, :index
    # get "/catalogs", CatalogController, :index
    get "/credit_types", CreditTypeController, :index
    get "/customers", CustomerController, :index
    get "/products", ProductController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuatemalaWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GuatemalaWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
