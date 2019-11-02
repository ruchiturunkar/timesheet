defmodule Timesheet1Web.Router do
  use Timesheet1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Timesheet1Web.Plugs.GetCurrentUser
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Timesheet1Web do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/jobs", JobController
    resources "/timesheets", TimesheetController
    resources "/sessions", SessionController, 
      only: [:new, :create, :delete], singleton: true

  end

  # Other scopes may use custom stacks.
  # scope "/api", Timesheet1Web do
  #   pipe_through :api
  # end
end
