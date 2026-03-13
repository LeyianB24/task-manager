defmodule ChatAppWeb.ProjectController do
  use ChatAppWeb, :controller

  alias ChatApp.Projects
  alias ChatApp.Projects.Project

  action_fallback ChatAppWeb.FallbackController

  def index(conn, _params) do
    projects = Projects.list_user_projects(conn.assigns.current_user.id)
    render(conn, :index, projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    project_params = Map.put(project_params, "user_id", conn.assigns.current_user.id)
    with {:ok, %Project{} = project} <- Projects.create_project(project_params) do
      conn
      |> put_status(:created)
      |> render(:show, project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    render(conn, :show, project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    with {:ok, %Project{} = project} <- Projects.update_project(project, project_params) do
      render(conn, :show, project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)

    with {:ok, %Project{}} <- Projects.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
