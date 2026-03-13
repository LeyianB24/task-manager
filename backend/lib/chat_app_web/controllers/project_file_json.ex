defmodule ChatAppWeb.ProjectFileJSON do
  def index(%{project_files: project_files}) do
    %{data: for(project_file <- project_files, do: data(project_file))}
  end

  def show(%{project_file: project_file}) do
    %{data: data(project_file)}
  end

  def data(project_file) do
    %{
      id: project_file.id,
      path: project_file.path,
      name: project_file.name,
      content: project_file.content,
      type: project_file.type,
      project_id: project_file.project_id
    }
  end
end
