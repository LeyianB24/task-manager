defmodule ChatAppWeb.IssueJSON do
  def index(%{issues: issues}) do
    %{data: for(issue <- issues, do: data(issue))}
  end

  def show(%{issue: issue}) do
    %{data: data(issue)}
  end

  def data(issue) do
    %{
      id: issue.id,
      title: issue.title,
      description: issue.description,
      status: issue.status,
      project_id: issue.project_id,
      user_id: issue.user_id
    }
  end
end
