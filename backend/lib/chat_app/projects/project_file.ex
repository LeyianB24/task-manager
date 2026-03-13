defmodule ChatApp.Projects.ProjectFile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "project_files" do
    field :content, :string
    field :name, :string
    field :path, :string
    field :type, :string
    field :project_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project_file, attrs) do
    project_file
    |> cast(attrs, [:path, :name, :content, :type])
    |> validate_required([:path, :name, :content, :type])
  end
end
