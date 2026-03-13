defmodule ChatAppWeb.SavedRequestController do
  use ChatAppWeb, :controller

  alias ChatApp.Workbench
  alias ChatApp.Workbench.SavedRequest

  action_fallback ChatAppWeb.FallbackController

  def index(conn, _params) do
    saved_requests = Workbench.list_user_saved_requests(conn.assigns.current_user.id)
    render(conn, :index, saved_requests: saved_requests)
  end

  def create(conn, %{"saved_request" => request_params}) do
    request_params = Map.put(request_params, "user_id", conn.assigns.current_user.id)
    with {:ok, %SavedRequest{} = saved_request} <- Workbench.create_saved_request(request_params) do
      conn
      |> put_status(:created)
      |> render(:show, saved_request: saved_request)
    end
  end

  def show(conn, %{"id" => id}) do
    saved_request = Workbench.get_saved_request!(id)
    render(conn, :show, saved_request: saved_request)
  end

  def update(conn, %{"id" => id, "saved_request" => request_params}) do
    saved_request = Workbench.get_saved_request!(id)

    with {:ok, %SavedRequest{} = saved_request} <- Workbench.update_saved_request(saved_request, request_params) do
      render(conn, :show, saved_request: saved_request)
    end
  end

  def delete(conn, %{"id" => id}) do
    saved_request = Workbench.get_saved_request!(id)

    with {:ok, %SavedRequest{}} <- Workbench.delete_saved_request(saved_request) do
      send_resp(conn, :no_content, "")
    end
  end
end
