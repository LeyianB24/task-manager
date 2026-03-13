defmodule ChatApp.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :description, :string
    field :name, :string
    field :visibility, :string
    field :user_id, :binary_id
    field :workspace_id, :binary_id

    belongs_to :workspace, ChatApp.Workspaces.Workspace, define_field: false
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :visibility, :workspace_id])
    |> validate_required([:name, :description, :visibility])
  end
end
