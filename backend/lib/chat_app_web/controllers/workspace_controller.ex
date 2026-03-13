defmodule ChatAppWeb.WorkspaceController do
  use ChatAppWeb, :controller

  alias ChatApp.Workspaces
  alias ChatApp.Workspaces.Workspace

  action_fallback ChatAppWeb.FallbackController

  def index(conn, _params) do
    workspaces = Workspaces.list_user_workspaces(conn.assigns.current_user.id)
    render(conn, :index, workspaces: workspaces)
  end

  def create(conn, %{"workspace" => workspace_params}) do
    workspace_params = Map.put(workspace_params, "owner_id", conn.assigns.current_user.id)
    with {:ok, %Workspace{} = workspace} <- Workspaces.create_workspace(workspace_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/workspaces/#{workspace}")
      |> render(:show, workspace: workspace)
    end
  end

  def show(conn, %{"id" => id}) do
    workspace = Workspaces.get_workspace!(id)
    render(conn, :show, workspace: workspace)
  end

  def update(conn, %{"id" => id, "workspace" => workspace_params}) do
    workspace = Workspaces.get_workspace!(id)

    with {:ok, %Workspace{} = workspace} <- Workspaces.update_workspace(workspace, workspace_params) do
      render(conn, :show, workspace: workspace)
    end
  end

  def delete(conn, %{"id" => id}) do
    workspace = Workspaces.get_workspace!(id)

    with {:ok, %Workspace{}} <- Workspaces.delete_workspace(workspace) do
      send_resp(conn, :no_content, "")
    end
  end
end
