defmodule ChatApp.Repo.Migrations.CreateSavedRequests do
  use Ecto.Migration

  def change do
    create table(:saved_requests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :method, :string
      add :url, :string
      add :headers, :map
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:saved_requests, [:user_id])
  end
end
