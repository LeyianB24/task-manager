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
    belongs_to :board, ChatApp.Workspaces.Board, type: :binary_id
    belongs_to :assignee, ChatApp.Accounts.User, foreign_key: :assignee_id, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :order, :board_id, :assignee_id])
    |> validate_required([:title, :description, :status, :order, :board_id])
  end
end
