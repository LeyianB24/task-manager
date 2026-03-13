defmodule ChatAppWeb.Router do
  use ChatAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatAppWeb do
    pipe_through :api

    post "/users/register", UserController, :create
    post "/users/login", SessionController, :create
  end

  # Protected API Routes
  pipeline :api_auth do
    plug :api
    plug ChatAppWeb.Plugs.RequireAuth
  end

  scope "/api", ChatAppWeb do
    pipe_through :api_auth
    
    resources "/workspaces", WorkspaceController, except: [:new, :edit]
    resources "/boards", BoardController, except: [:new, :edit]
    resources "/tasks", TaskController, except: [:new, :edit]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:chat_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ChatAppWeb.Telemetry
    end
  end
end
