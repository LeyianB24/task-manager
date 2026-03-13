defmodule ChatAppWeb.BoardChannel do
  use ChatAppWeb, :channel

  @impl true
  def join("board:" <> board_id, _payload, socket) do
    # In a real app, we'd verify the user has access to this board
    {:ok, assign(socket, :board_id, board_id)}
  end

  @impl true
  def handle_in("task_moved", payload, socket) do
    broadcast_from!(socket, "task_moved", payload)
    {:noreply, socket}
  end

  @impl true
  def handle_in("task_created", payload, socket) do
    broadcast_from!(socket, "task_created", payload)
    {:noreply, socket}
  end
end
