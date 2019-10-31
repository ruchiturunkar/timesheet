defmodule Timesheet1Web.PageController do
  use Timesheet1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
