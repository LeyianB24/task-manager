defmodule ChatAppWeb.BoardController do
  use ChatAppWeb, :controller

  alias ChatApp.Workspaces
  alias ChatApp.Workspaces.Board

  action_fallback ChatAppWeb.FallbackController

  def index(conn, %{"workspace_id" => workspace_id}) do
    boards = Workspaces.list_boards_for_workspace(workspace_id)
    render(conn, :index, boards: boards)
  end

  def index(conn, _params) do
    boards = Workspaces.list_boards()
    render(conn, :index, boards: boards)
  end

  def create(conn, %{"board" => board_params}) do
    with {:ok, %Board{} = board} <- Workspaces.create_board(board_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/boards/#{board}")
      |> render(:show, board: board)
    end
  end

  def show(conn, %{"id" => id}) do
    board = Workspaces.get_board!(id)
    render(conn, :show, board: board)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Workspaces.get_board!(id)

    with {:ok, %Board{} = board} <- Workspaces.update_board(board, board_params) do
      render(conn, :show, board: board)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Workspaces.get_board!(id)

    with {:ok, %Board{}} <- Workspaces.delete_board(board) do
      send_resp(conn, :no_content, "")
    end
  end
end
