defmodule ChatApp.Repo.Migrations.CreateProjectFiles do
  use Ecto.Migration

  def change do
    create table(:project_files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :path, :string
      add :name, :string
      add :content, :text
      add :type, :string
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:project_files, [:project_id])
  end
end
