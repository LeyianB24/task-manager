defmodule ChatApp.Workspaces.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :description, :string
    field :order, :integer
    field :status, :string
    field :title, :string
    field :board_id, :binary_id
    field :assignee_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :order])
    |> validate_required([:title, :description, :status, :order])
  end
end
