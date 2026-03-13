defmodule ChatAppWeb.IssueController do
  use ChatAppWeb, :controller

  alias ChatApp.Projects
  alias ChatApp.Projects.Issue

  action_fallback ChatAppWeb.FallbackController

  def index(conn, %{"project_id" => project_id}) do
    issues = Projects.list_project_issues(project_id)
    render(conn, :index, issues: issues)
  end

  def create(conn, %{"issue" => issue_params}) do
    issue_params = Map.put(issue_params, "user_id", conn.assigns.current_user.id)
    with {:ok, %Issue{} = issue} <- Projects.create_issue(issue_params) do
      conn
      |> put_status(:created)
      |> render(:show, issue: issue)
    end
  end

  def show(conn, %{"id" => id}) do
    issue = Projects.get_issue!(id)
    render(conn, :show, issue: issue)
  end

  def update(conn, %{"id" => id, "issue" => issue_params}) do
    issue = Projects.get_issue!(id)

    with {:ok, %Issue{} = issue} <- Projects.update_issue(issue, issue_params) do
      render(conn, :show, issue: issue)
    end
  end

  def delete(conn, %{"id" => id}) do
    issue = Projects.get_issue!(id)

    with {:ok, %Issue{}} <- Projects.delete_issue(issue) do
      send_resp(conn, :no_content, "")
    end
  end
end
