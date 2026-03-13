defmodule ChatApp.Repo.Migrations.AddCrossModuleLinks do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :workspace_id, references(:workspaces, on_delete: :nothing, type: :binary_id)
    end

    alter table(:saved_requests) do
      add :workspace_id, references(:workspaces, on_delete: :nothing, type: :binary_id)
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id)
    end

    create index(:projects, [:workspace_id])
    create index(:saved_requests, [:workspace_id])
    create index(:saved_requests, [:project_id])
  end
end
