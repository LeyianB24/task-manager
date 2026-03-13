defmodule ChatAppWeb.ProjectFileController do
  use ChatAppWeb, :controller

  alias ChatApp.Projects
  alias ChatApp.Projects.ProjectFile

  action_fallback ChatAppWeb.FallbackController

  def index(conn, %{"project_id" => project_id}) do
    project_files = Projects.list_project_files(project_id)
    render(conn, :index, project_files: project_files)
  end

  def create(conn, %{"project_file" => file_params}) do
    with {:ok, %ProjectFile{} = project_file} <- Projects.create_project_file(file_params) do
      conn
      |> put_status(:created)
      |> render(:show, project_file: project_file)
    end
  end

  def show(conn, %{"id" => id}) do
    project_file = Projects.get_project_file!(id)
    render(conn, :show, project_file: project_file)
  end

  def update(conn, %{"id" => id, "project_file" => file_params}) do
    project_file = Projects.get_project_file!(id)

    with {:ok, %ProjectFile{} = project_file} <- Projects.update_project_file(project_file, file_params) do
      render(conn, :show, project_file: project_file)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_file = Projects.get_project_file!(id)

    with {:ok, %ProjectFile{}} <- Projects.delete_project_file(project_file) do
      send_resp(conn, :no_content, "")
    end
  end
end
