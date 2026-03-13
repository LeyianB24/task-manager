defmodule ChatAppWeb.ProjectJSON do
  def index(%{projects: projects}) do
    %{data: for(project <- projects, do: data(project))}
  end

  def show(%{project: project}) do
    %{data: data(project)}
  end

  def data(project) do
    %{
      id: project.id,
      name: project.name,
      description: project.description,
      visibility: project.visibility,
      user_id: project.user_id
    }
  end
end
