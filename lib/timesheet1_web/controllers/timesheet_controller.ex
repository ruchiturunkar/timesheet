defmodule Timesheet1Web.TimesheetController do
  use Timesheet1Web, :controller

  alias Timesheet1.Timesheets
  alias Timesheet1.Timesheets.Timesheet

  def index(conn, _params) do
    timesheets = Timesheets.list_timesheets()
    render(conn, "index.html", timesheets: timesheets)
  end

  def new(conn, _params) do
    changeset = Timesheets.change_timesheet(%Timesheet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timesheet" => timesheet_params}) do
    case Timesheets.create_timesheet(timesheet_params) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet created successfully.")
        |> redirect(to: Routes.timesheet_path(conn, :show, timesheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    render(conn, "show.html", timesheet: timesheet)
  end

  def edit(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    changeset = Timesheets.change_timesheet(timesheet)
    render(conn, "edit.html", timesheet: timesheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timesheet" => timesheet_params}) do
    timesheet = Timesheets.get_timesheet!(id)

    case Timesheets.update_timesheet(timesheet, timesheet_params) do
      {:ok, timesheet} ->
        conn
        |> put_flash(:info, "Timesheet updated successfully.")
        |> redirect(to: Routes.timesheet_path(conn, :show, timesheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timesheet: timesheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timesheet = Timesheets.get_timesheet!(id)
    {:ok, _timesheet} = Timesheets.delete_timesheet(timesheet)

    conn
    |> put_flash(:info, "Timesheet deleted successfully.")
    |> redirect(to: Routes.timesheet_path(conn, :index))
  end
end
