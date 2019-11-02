defmodule Timesheet1.Repo.Migrations.CreateTimesheets do
  use Ecto.Migration

  def change do
    create table(:timesheets) do
      add :jobId, :string, null: false
      add :hours, :integer, null: false
      add :date, :date, null: false
      add :status, :string, default: "New"
      add :user, references(:users, on_delete: :nothing)
      add :manager, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:timesheets, [:user])
    create index(:timesheets, [:manager])
  end
end
