defmodule ChatAppWeb.TaskController do
  use ChatAppWeb, :controller

  alias ChatApp.Workspaces
  alias ChatApp.Workspaces.Task

  action_fallback ChatAppWeb.FallbackController

  def index(conn, %{"board_id" => board_id}) do
    tasks = Workspaces.list_tasks_for_board(board_id)
    render(conn, :index, tasks: tasks)
  end

  def index(conn, _params) do
    tasks = Workspaces.list_tasks()
    render(conn, :index, tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Workspaces.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tasks/#{task}")
      |> render(:show, task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Workspaces.get_task!(id)
    render(conn, :show, task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Workspaces.get_task!(id)

    with {:ok, %Task{} = task} <- Workspaces.update_task(task, task_params) do
      render(conn, :show, task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Workspaces.get_task!(id)

    with {:ok, %Task{}} <- Workspaces.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
