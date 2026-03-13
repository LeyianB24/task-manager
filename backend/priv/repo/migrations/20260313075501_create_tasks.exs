defmodule ChatApp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :status, :string
      add :order, :integer
      add :board_id, references(:boards, on_delete: :nothing, type: :binary_id)
      add :assignee_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:tasks, [:board_id])
    create index(:tasks, [:assignee_id])
  end
end
