defmodule ChatApp.Workbench.SavedRequest do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_requests" do
    field :body, :string
    field :headers, :map
    field :method, :string
    field :name, :string
    field :url, :string
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_request, attrs) do
    saved_request
    |> cast(attrs, [:name, :method, :url, :headers, :body])
    |> validate_required([:name, :method, :url, :body])
  end
end
